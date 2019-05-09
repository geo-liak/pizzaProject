<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <!-- FONT AWESOME ( Icons ) -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
              integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <!-- Style css -->
        <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
        <title>Dashboard</title>
        
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

    </head>


    <body>
        <!-- HEADER -->

        <c:choose>
            <c:when test="${privileges}">
                <jsp:include page= "/WEB-INF/views/pages/jsp/header_admin.jsp" />
            </c:when>
            <c:otherwise>
                <%@include file = "/WEB-INF/views/pages/jsp/header.jsp" %>
            </c:otherwise>
        </c:choose>
        <br><br>

        <div class="container col-8">

            <div class="card shadow panel panel-default">
                <div class="card-body panel-body">
                    <div class="login-container border-0" >

                        <div class="row">
                            <div class="offset-sm-1 col-sm-10 offset-md-2 col-md-8 offset-lg-3 col-lg-6">

                                <div class="form-signin">
                                    <div class="form-group">
                                <h2>Chat with us</h2>
                                        <input class="form-control" type="text" id="from" placeholder="Choose a nickname" value="${pageContext.request.userPrincipal.name}"/>

                                        <button class="btn btn-sm btn-primary" id="connect" onclick="connect();">Connect</button>
                                        <button class="btn btn-sm btn-primary" id="disconnect" disabled="disabled" onclick="disconnect();">
                                            Disconnect
                                        </button>
                                    </div>
                                    <br />
                                    <div id="conversationDiv" class="form-group">
                                        <input class="form-control" type="text" id="text" placeholder="Write a message..." />
                                        <button class="btn btn-sm btn-primary" id="sendMessage" onclick="sendMessage();">Send</button>
                                        <br /><br /><br />
                                        <div id="response" style="max-height:500px; overflow-y:auto;"></div>
                                        <br /><br /><br />
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
        <br /><br /><br />

        <jsp:include page= "/WEB-INF/views/pages/jsp/footer.jsp" />





        <!-- FINAL IMPORTS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
                integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous">
        </script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
                integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous">
        </script>
        <script src="home.js"></script>
        <script type="text/javascript">
            var stompClient = null;

            function setConnected(connected) {
                document.getElementById('connect').disabled = connected;
                document.getElementById('disconnect').disabled = !connected;
                document.getElementById('conversationDiv').style.visibility
                    = connected ? 'visible' : 'hidden';
                document.getElementById('response').innerHTML = '<br />';
            }

            function connect() {
                var socket = new SockJS('${contextPath}/chat');
                stompClient = Stomp.over(socket);
                stompClient.connect({}, function(frame) {
                    setConnected(true);
                    console.log('Connected: ' + frame);
                    stompClient.subscribe('/topic/messages', function(messageOutput) {
                        showMessageOutput(JSON.parse(messageOutput.body));
                    });
                });
            }

            function disconnect() {
                if(stompClient != null) {
                    stompClient.disconnect();
                }
                setConnected(false);
                console.log("Disconnected");
            }

            function sendMessage() {
                var from = document.getElementById('from').value;
                var text = document.getElementById('text').value;
                stompClient.send("/app/chat", {},
                    JSON.stringify({'from':from, 'text':text}));
            }

            function showMessageOutput(messageOutput) {
                var response = document.getElementById('response');
                var textSender = document.createElement('div');
                textSender.style.padding = '2px 20px';
                textSender.style.fontWeight = 'bold';
                textSender.appendChild(document.createTextNode(messageOutput.from + " (" + messageOutput.time + ")"));
                var textMsg = document.createElement('div');
                textMsg.style.backgroundColor = '#ffff66';
                textMsg.style.wordWrap = 'break-word';
                textMsg.style.border = '1px solid #ddd';
                textMsg.style.padding = '5px 20px';
                textMsg.style.borderRadius = '20px';
                textMsg.appendChild(document.createTextNode(messageOutput.text));

                response.insertBefore(document.createElement('br'), response.firstChild);
                response.insertBefore(textMsg, response.firstChild);
                response.insertBefore(textSender, response.firstChild);
            }

            $(document).ready(function () {

                disconnect();
            });
        </script>
    </body>

</html>