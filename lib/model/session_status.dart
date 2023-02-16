/// Status of one file transfer.
/// Both receiver and sender should share the same information.
enum SessionStatus {
  waiting, // wait for receiver response (wait for decline / accept)
  recipientBusy, // recipient is busy with another request (end of session)
  declined, // receiver declined the request (end of session)
  sending, // files are being sent
  finished, // all files sent (end of session)
  finishedWithErrors, // finished but some files could not be sent (end of session)
  canceledBySender, // cancellation by sender  (end of session)
  canceledByReceiver, // cancellation by receiver (end of session)
}
