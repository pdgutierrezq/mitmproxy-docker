"""
This example shows two ways to redirect flows to another server.
"""
from mitmproxy import http

def request(flow: http.HTTPFlow) -> None:
    # pretty_host takes the "Host" header of the request into account,
    # which is useful in transparent mode where we usually only have the IP
    # otherwise.
    if flow.request.pretty_host == "10.5.10.169":
      if flow.request.path == '/CustomerConditions':
        flow.request.host = "192.168.135.28"
        flow.request.scheme = "https"
        flow.request.port = 442
        flow.request.path = '/PFBA_Crm31/sca/WSBA_Crm_consultarCondicionesCliente'
      if flow.request.path == '/mock':
#         flow.request.host = "rb-dev-alb-ecs-ext-525169194.us-east-2.elb.amazonaws.com"
        flow.request.host = "localhost"
        flow.request.port = 80
        flow.request.path = '/castlemock/mock/soap/project/7cGqrI/CustomerConditionsInquirySvcPort'