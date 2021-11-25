"""
This example shows two ways to redirect flows to another server.
"""
from mitmproxy import http

def request(flow: http.HTTPFlow) -> None:
    # pretty_host takes the "Host" header of the request into account,
    # which is useful in transparent mode where we usually only have the IP
    # otherwise.
    if flow.request.pretty_host == "10.5.8.216":
      if flow.request.path == '/CustomerConditions':
        flow.request.host = "bb-stg-alb-ecs-ext-902953221.us-east-2.elb.amazonaws.com"
        flow.request.port = 80
        flow.request.path = '/castlemock/mock/soap/project/7cGqrI/CustomerConditionsInquirySvcPort'
