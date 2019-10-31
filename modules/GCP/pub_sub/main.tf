
resource "google_pubsub_topic" "bidder-response-request" {
name = "${var.name_topic}"
}

resource "google_pubsub_subscription" "bidder-response-request-to-bq" {
name = "bidder-response-request-to-bq"
topic = "${google_pubsub_topic.bidder-response-request.name}"

ack_deadline_seconds = "${var.ack_deadline_seconds}"
}