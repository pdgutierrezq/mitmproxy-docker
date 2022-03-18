"""
This example shows two ways to redirect flows to another server.
"""
from mitmproxy import http, ctx


def request(flow: http.HTTPFlow) -> None:
  # pretty_host takes the "Host" header of the request into account,
  # which is useful in transparent mode where we usually only have the IP
  # otherwise.
  #     if flow.request.pretty_host == "10.5.10.169":
  if flow.request.pretty_host == "proxy":
    request = Request(flow.request.path)
    ctx.log.info(request.toString())
    flow.request.host = request.host
    flow.request.scheme = request.scheme
    flow.request.port = request.port
    flow.request.path = request.path
    if flow.request.path == '/PFBA_AhorrosyCtaCte40/WRBA_AhorrosyCtaCte_validarSeguros':
      flow.request.headers["content-type"] = "application/x-www-form-urlencoded"
    # if flow.request.path == '/https://192.168.135.28:442/PFBA_Crm31/sca/WSBA_Crm_consultarCondicionesCliente':
    # if flow.request.path == '/mock':
    #   #         flow.request.host = "rb-dev-alb-ecs-ext-525169194.us-east-2.elb.amazonaws.com"
    #   flow.request.host = "localhost"
    #   flow.request.port = 80
    #   flow.request.path = '/castlemock/mock/soap/project/7cGqrI/CustomerConditionsInquirySvcPort'


class Request:
  def __init__(self, path):
    initialPath = path.split('/', 4)
    self.scheme = initialPath[1].replace(':', '')
    if (self.scheme == 'http'):
      self.port = "80"
    else:
      self.port = "443"
    self.host = initialPath[3]
    splitHost = initialPath[3].split(':')
    if (len(splitHost) > 1):
      self.host = splitHost[0]
      self.port = splitHost[1]
    self.path = '/' + initialPath[4]

  def toString(self):
    return "Scheme:" + self.scheme +'\n'\
           + "Host:" + self.host +'\n'\
           + "Port:" + self.port +'\n'\
           + "Path:" + self.path +'\n'
# Examples
# print(Request(
#   '/https://192.168.135.28:442/PFBA_Crm31/sca/WSBA_Crm_consultarCondicionesCliente').toString())
# print(Request(
#   '/https://192.168.135.28/PFBA_Crm31/sca/WSBA_Crm_consultarCondicionesCliente').toString())
# print(Request(
#   '/http://192.168.135.28/PFBA_Crm31/sca/WSBA_Crm_consultarCondicionesCliente').toString())
