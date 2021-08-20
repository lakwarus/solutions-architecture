import ballerina/tcp;
public function main() returns error? {
    tcp:Client socketClient = check new ("localhost", 6060);

    string msg = "TASK | ID001 | PALLET202 | DOOR53 | AISLE26";
    byte[] msgByteArray = msg.toBytes();
    check socketClient->writeBytes(msgByteArray);
    check socketClient->close();
}