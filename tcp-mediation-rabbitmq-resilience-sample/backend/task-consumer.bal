import ballerina/io;
import ballerinax/rabbitmq;
listener rabbitmq:Listener channelListener =
        new(rabbitmq:DEFAULT_HOST, rabbitmq:DEFAULT_PORT);
@rabbitmq:ServiceConfig {
    queueName: "task"
}

service rabbitmq:Service on channelListener {
    remote function onMessage(rabbitmq:Message message) {
        string|error messageContent = string:fromBytes(message.content);
        if messageContent is string {
            io:println(messageContent);
        }
    }
}
