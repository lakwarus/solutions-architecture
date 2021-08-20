import ballerina/io;
import ballerina/log;
import ballerina/tcp;
service on new tcp:Listener(6061) {

    remote function onConnect(tcp:Caller caller)
                              returns tcp:ConnectionService {
        io:println("Client connected to echo server: ", caller.remotePort);
        return new EchoService();
    }
}

service class EchoService {
    remote function onBytes(tcp:Caller caller, readonly & byte[] data) 
        returns tcp:Error? {
        io:println("Echo: ", string:fromBytes(data));

        check caller->writeBytes(data);
    }

    remote function onError(tcp:Error err) returns tcp:Error? {
        log:printError("An error occurred", 'error = err);
    }

    remote function onClose() returns tcp:Error? {
        io:println("Client left");
    }
}

