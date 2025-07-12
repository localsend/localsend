use tokio_cron_scheduler::{Job, JobScheduler};

use crate::config::state::IpRequestCountMap;

pub async fn configure_scheduling(
    ip_request_count_map: IpRequestCountMap,
) -> Result<(), Box<dyn std::error::Error>> {
    let scheduler = JobScheduler::new().await?;

    scheduler
        .add(Job::new_async("0 0 * * * *", move |_uuid, _l| {
            Box::pin({
                let value = ip_request_count_map.clone();
                async move {
                    value.lock().await.clear();
                }
            })
        })?)
        .await?;

    scheduler.start().await?;

    Ok(())
}
