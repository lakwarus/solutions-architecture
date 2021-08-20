import ballerinax/rabbitmq;
public function main() returns error? {
    rabbitmq:Client newClient =
                check new(rabbitmq:DEFAULT_HOST, rabbitmq:DEFAULT_PORT);

    string message = "TASK | ID001 | STATUS | SUCCESS";
    check newClient->publishMessage({ content: message.toBytes(),
                                            routingKey: "taskstatus" });
}
