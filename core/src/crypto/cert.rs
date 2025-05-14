use std::io::Cursor;
use x509_parser::asn1_rs::FromDer;
use x509_parser::certificate::X509Certificate;
use x509_parser::pem::Pem;
use x509_parser::x509::SubjectPublicKeyInfo;

pub fn verify_cert_from_pem(cert: String, public_key: Option<String>) -> anyhow::Result<()> {
    let (cert_pem, _) = Pem::read(Cursor::new(cert.into_bytes()))?;
    let parsed_cert: X509Certificate = cert_pem.parse_x509()?;

    verify_cert_from_cert(parsed_cert, public_key)
}

pub fn verify_cert_from_der(cert: &[u8], public_key: Option<String>) -> anyhow::Result<()> {
    let (_, parsed_cert) = X509Certificate::from_der(&cert)?;

    verify_cert_from_cert(parsed_cert, public_key)
}

/// Verifies if the certificate is valid
/// - according to the signature
/// - according to the time validity
/// - according to the public key (if provided)
fn verify_cert_from_cert(cert: X509Certificate, public_key: Option<String>) -> anyhow::Result<()> {
    if !cert.validity.is_valid() {
        return Err(anyhow::anyhow!("Time validity error"));
    }

    if let Some(public_key) = public_key {
        let cert_public_key = cert.tbs_certificate.subject_pki.parsed()?;

        let (public_key_pem, _) = Pem::read(Cursor::new(public_key.into_bytes()))?;
        let (_, public_key_spki) = SubjectPublicKeyInfo::from_der(&public_key_pem.contents)?;
        let expected_public_key = public_key_spki.parsed()?;

        if cert_public_key != expected_public_key {
            // We catch public key mismatch separately from signature verification
            // so that we can better unit test the function
            return Err(anyhow::anyhow!("Public key mismatch"));
        }
    }

    cert.verify_signature(None)?;

    Ok(())
}

pub fn public_key_from_cert_pem(cert: String) -> anyhow::Result<String> {
    let (cert_pem, _) = Pem::read(Cursor::new(cert.into_bytes()))?;
    let parsed_cert: X509Certificate = cert_pem.parse_x509()?;
    public_key_from_cert(parsed_cert)
}

pub fn public_key_from_cert_der(cert: &[u8]) -> anyhow::Result<String> {
    let (_, parsed_cert) = X509Certificate::from_der(&cert)?;
    public_key_from_cert(parsed_cert)
}

/// Extracts the public key from the certificate.
/// Encodes the public key in PEM format.
pub fn public_key_from_cert(cert: X509Certificate) -> anyhow::Result<String> {
    let cert_public_key = cert.tbs_certificate.subject_pki.raw;
    let public_key = pem::encode(&pem::Pem::new("PUBLIC KEY", cert_public_key.to_vec()));
    Ok(public_key)
}

#[cfg(test)]
mod tests {
    use super::*;

    static PUBLIC_KEY: &str = "-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAi9uDMYRn63SZtEPGRogZ
Gdu5XXBAoQeMO60mycoinqLKDWyZdpMo+XWY3wYVhoAyxgzDOcPjIf+Uq1oEy/0K
4WwfpbK8SCy851qgYkfMCT9D9mFvXwWoULJCUHFF7f947ArDE1nmuK1nNx2RodN2
wJCXyzPjw0jn06bwGeg0EqfUC8wvW4FTZ6t1tErzmRqRdMUWuCJwsk1IMbDbFePh
iK5jecOBG0RVVWLuw+TkuX8TUgrpIktH2+qEM1KdLyAMnL71hx2wMvE+lDKFKK9p
37zXK8omjl+VgTC8ocjGeYDDsl43ZtW09V0pb7Vz2FM8b7BgM06kvJl48PIe5puY
bQIDAQAB
-----END PUBLIC KEY-----";

    #[test]
    fn test_verify_cert() {
        let cert = "-----BEGIN CERTIFICATE-----
MIIDGTCCAgGgAwIBAgIBATANBgkqhkiG9w0BAQsFADBQMRcwFQYDVQQDEw5Mb2Nh
bFNlbmQgVXNlcjEJMAcGA1UEChMAMQkwBwYDVQQLEwAxCTAHBgNVBAcTADEJMAcG
A1UECBMAMQkwBwYDVQQGEwAwHhcNMjUwMjA5MDAwMzE0WhcNMzUwMjA3MDAwMzE0
WjBQMRcwFQYDVQQDEw5Mb2NhbFNlbmQgVXNlcjEJMAcGA1UEChMAMQkwBwYDVQQL
EwAxCTAHBgNVBAcTADEJMAcGA1UECBMAMQkwBwYDVQQGEwAwggEiMA0GCSqGSIb3
DQEBAQUAA4IBDwAwggEKAoIBAQCL24MxhGfrdJm0Q8ZGiBkZ27ldcEChB4w7rSbJ
yiKeosoNbJl2kyj5dZjfBhWGgDLGDMM5w+Mh/5SrWgTL/QrhbB+lsrxILLznWqBi
R8wJP0P2YW9fBahQskJQcUXt/3jsCsMTWea4rWc3HZGh03bAkJfLM+PDSOfTpvAZ
6DQSp9QLzC9bgVNnq3W0SvOZGpF0xRa4InCyTUgxsNsV4+GIrmN5w4EbRFVVYu7D
5OS5fxNSCukiS0fb6oQzUp0vIAycvvWHHbAy8T6UMoUor2nfvNcryiaOX5WBMLyh
yMZ5gMOyXjdm1bT1XSlvtXPYUzxvsGAzTqS8mXjw8h7mm5htAgMBAAEwDQYJKoZI
hvcNAQELBQADggEBABZ+I7D6wkeSrsi1NBLP2zoZ5oGh+INNcGTravfOQHs4Fbas
/CysaUYjsD3fmaDh4MxgWEqAmWnnBiojfpGX2SGuFqRBKyT9DgitBt0L7Ezg1k3h
bfSiFW4hXWp75grVO8xfML7ZcWMlhKrOsOMUGiy1qs3qsyJ3w7B2Tz78HhXGO5dd
jyPmZarhixKO92UpEvKGxjO0E/3UUNUzxKTAAgFfhKpuwHUgIijM/EppZtA8OcSh
fEztiV0xKfcPVx4d6dqRt/NMElK1Ivw2vUuxTymphZkkFOzht9m73/kyKaeFp8Ij
VRus1zGVD8IVpIdPMyz01WJyS7M0fWaHXKWo+Bo=
-----END CERTIFICATE-----"
            .to_string();
        assert_eq!(
            verify_cert_from_pem(cert, Some(PUBLIC_KEY.to_owned())).map_err(|e| e.to_string()),
            Ok(())
        );

        let cert_invalid_signature = "-----BEGIN CERTIFICATE-----
MIIDGTCCAgGgAwIBAgIBATANBgkqhkiG9w0BAQsFADBQMRcwFQYDVQQDEw5Mb2Nh
bFNlbmQgVXNlcjEJMAcGA1UEChMAMQkwBwYDVQQLEwAxCTAHBgNVBAcTADEJMAcG
A1UECBMAMQkwBwYDVQQGEwAwHhcNMjUwMjA5MDAwMzE0WhcNMzUwMjA3MDAwMzE0
WjBQMRcwFQYDVQQDEw5Mb2NhbFNlbmQgVXNlcjEJMAcGA1UEChMAMQkwBwYDVQQL
EwAxCTAHBgNVBAcTADEJMAcGA1UECBMAMQkwBwYDVQQGEwAwggEiMA0GCSqGSIb3
DQEBAQUAA4IBDwAwggEKAoIBAQCL24MxhGfrdJm0Q8ZGiBkZ27ldcEChB4w7rSbJ
yiKeosoNbJl2kyj5dZjfBhWGgDLGDMM5w+Mh/5SrWgTL/QrhbB+lsrxILLznWqBi
R8wJP0P2YW9fBahQskJQcUXt/3jsCsMTWea4rWc3HZGh03bAkJfLM+PDSOfTpvAZ
6DQSp9QLzC9bgVNnq3W0SvOZGpF0xRa4InCyTUgxsNsV4+GIrmN5w4EbRFVVYu7D
5OS5fxNSCukiS0fb6oQzUp0vIAycvvWHHbAy8T6UMoUor2nfvNcryiaOX5WBMLyh
yMZ5gMOyXjdm1bT1XSlvtXPYUzxvsGAzTqS8mXjw8h7mm5htAgMBAAEwDQYJKoZI
hvcNAQELBQADggEBABZ+I7D6wkeSrsi1NBLP2zoZ5oGh+INNcGTravfOQHs4Fbas
/CysaUYjsD3fmaDh4MxgWEqAmWnnBiojfpGX2SGuFqRBKyT9DgitBt0L7Ezg1k3h
bfSiFW4hXWp75grVO8xfML7ZcWMlhKrOsOMUGiy1qs3qsyJ3w7B2Tz78HhXGO5dd
jyPmZarhixKO92UpEvKGxjO0E/3UUNUzxKTAAgFfhKpuwHUgIijM/EppZtA8OcSh
fEztiV0xKfcPVx4d6dqRt/NMElK1Ivw2vUuxTymphZkkFOzht9m73/kyKaeFp8Ij
VRus1zGVD8IVpIdPMyz01WJySwAAAAAAAAAAAAA=
-----END CERTIFICATE-----"
            .to_string();
        assert_eq!(
            verify_cert_from_pem(cert_invalid_signature, Some(PUBLIC_KEY.to_owned()))
                .map_err(|e| e.to_string()),
            Err("signature verification error".to_string())
        );

        let cert_invalid_public_key = "-----BEGIN CERTIFICATE-----
MIIDGTCCAgGgAwIBAgIBATANBgkqhkiG9w0BAQsFADBQMRcwFQYDVQQDEw5Mb2Nh
bFNlbmQgVXNlcjEJMAcGA1UEChMAMQkwBwYDVQQLEwAxCTAHBgNVBAcTADEJMAcG
A1UECBMAMQkwBwYDVQQGEwAwHhcNMjUwMjA5MDI1ODQxWhcNMzUwMjA3MDI1ODQx
WjBQMRcwFQYDVQQDEw5Mb2NhbFNlbmQgVXNlcjEJMAcGA1UEChMAMQkwBwYDVQQL
EwAxCTAHBgNVBAcTADEJMAcGA1UECBMAMQkwBwYDVQQGEwAwggEiMA0GCSqGSIb3
DQEBAQUAA4IBDwAwggEKAoIBAQCnrVjQQ0mAfBaucJd5rbZX9usLROwHDuXdczFq
XJhb8pPjEF18FoDHzobjz5JWq+GDkBmcg0k6+AeETGQEaJisZDBWH7NOjJahGGnQ
0okw1iVUoEpQ26ZSFkr3H5NNtGAa6EkS4xb0bsEDb3vs69zRvFyrVd6OEqmdsRy3
aU2AvAMoLthgY8bUZ/XyWpbA8euV3VjkRSHsju+DOQH4oj46ZITJ3M2/x5o/3jqJ
ILBhoLcu7UJJTHYqeBsPSTkMIGKLkYSUPOd/mSgwQB854wks4nf+hO4VWvKQFx9X
4gIjS7vJ6e9rQOn2NFfluPbRiijmWIiwUDUWz3UW2RS0b6gDAgMBAAEwDQYJKoZI
hvcNAQELBQADggEBAAO3rG2YcQqH8Z7jDX82q0nn/bglOWvTySv4EP3FNrVPZKfN
aR+oLo8WdAWulbxXDIOK7XLk1V9SxEJvVxOTp2EIgcoWqJANoWjp+5nNInE02eNX
G8euvPvh+p/1cTbHxhrZqtsSpkAx1AbbbcvT+5hUUDXSU7cMN+vFjUqkEVrBlj7S
vFbLDHP82ywisZrkOfNapxV67U4ENaEwJ4P4OERnqOOieJr0elv598cSDu+OSKmt
rFNYYHERELX36g4+KcWGN223Pg4Xl0bFYqV0xwRUThh0657t8cioXaOsjjpKnGAm
eVVihnrJ3sdk7nnreAYMse/OipyufRyZ9t3WU8A=
-----END CERTIFICATE-----"
            .to_string();
        assert_eq!(
            verify_cert_from_pem(cert_invalid_public_key, Some(PUBLIC_KEY.to_owned()))
                .map_err(|e| e.to_string()),
            Err("Public key mismatch".to_string())
        );

        let cert_expired = "-----BEGIN CERTIFICATE-----
MIIDGTCCAgGgAwIBAgIBATANBgkqhkiG9w0BAQsFADBQMRcwFQYDVQQDEw5Mb2Nh
bFNlbmQgVXNlcjEJMAcGA1UEChMAMQkwBwYDVQQLEwAxCTAHBgNVBAcTADEJMAcG
A1UECBMAMQkwBwYDVQQGEwAwHhcNMjUwMjA5MjEwOTQ0WhcNMjUwMjA5MjEwOTQ0
WjBQMRcwFQYDVQQDEw5Mb2NhbFNlbmQgVXNlcjEJMAcGA1UEChMAMQkwBwYDVQQL
EwAxCTAHBgNVBAcTADEJMAcGA1UECBMAMQkwBwYDVQQGEwAwggEiMA0GCSqGSIb3
DQEBAQUAA4IBDwAwggEKAoIBAQCL24MxhGfrdJm0Q8ZGiBkZ27ldcEChB4w7rSbJ
yiKeosoNbJl2kyj5dZjfBhWGgDLGDMM5w+Mh/5SrWgTL/QrhbB+lsrxILLznWqBi
R8wJP0P2YW9fBahQskJQcUXt/3jsCsMTWea4rWc3HZGh03bAkJfLM+PDSOfTpvAZ
6DQSp9QLzC9bgVNnq3W0SvOZGpF0xRa4InCyTUgxsNsV4+GIrmN5w4EbRFVVYu7D
5OS5fxNSCukiS0fb6oQzUp0vIAycvvWHHbAy8T6UMoUor2nfvNcryiaOX5WBMLyh
yMZ5gMOyXjdm1bT1XSlvtXPYUzxvsGAzTqS8mXjw8h7mm5htAgMBAAEwDQYJKoZI
hvcNAQELBQADggEBAH2/F6iEH8W5gIHcKJ6/EbrG2BY5Uhg5U8X6yPk6z9ctmY6w
n7fDT749PMVDJq+qhIcnoBlUgVJdJ2qFa5h3VaSF+tUFu/CImr+S8TYHCdQGYXA5
6b/pnHmbrWqZdNdxs6Y80A9Mu+iNeLDcrTo60/zGfJsiD9Cnlj0Q6c8nn+Obzeqq
iIwUmPFw0krH+ku/DlSenKnyL8jaktf48neufu0jObUvCuj62I2WlFZwzXd8CnDR
X2/mKq6FWHCDR6RTh1yMLfD+NoVNcswxwMFq8ILCfBuTjNVaSFm3eUqKeEOAaDes
nidU/qXQvBJ7NPUkXXgbcgqxK735iijOqQHmKts=
-----END CERTIFICATE-----"
            .to_string();
        assert_eq!(
            verify_cert_from_pem(cert_expired, Some(PUBLIC_KEY.to_owned()))
                .map_err(|e| e.to_string()),
            Err("Time validity error".to_string())
        );
    }
}
