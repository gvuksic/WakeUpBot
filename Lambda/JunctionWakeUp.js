const AWS = require('aws-sdk');
const dynamodb = new AWS.DynamoDB.DocumentClient();
var table = "JunctionBot";

exports.handler = function (event, context, callback) {
    var responseCode = 200;

    const params = {
        TableName: table,
        Key: {
            "id": "bot"
        },
        UpdateExpression: "set userId = :x",
        ExpressionAttributeValues: {
            ":x": "1"
        }
    };

    dynamodb.update(params, (err, data) => {
        if (err) console.log("dynamodb err: ", err, err.stack);
        else {
            let botResponse = "Sure! I'll wake him up!! 🔨";
            context.succeed(botResponse);
        }
    });

};