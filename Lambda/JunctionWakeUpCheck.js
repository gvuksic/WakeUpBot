const AWS = require('aws-sdk');
const dynamodb = new AWS.DynamoDB.DocumentClient();
var table = "JunctionBot";

exports.handler = function (event, context, callback) {
    var responseCode = 200;

    const params = {
        TableName: table,
        Key: {
            'id': 'bot'
        }
    };

    dynamodb.get(params, (err, data) => {
        if (err) console.log("dynamodb err: ", err, err.stack);
        else {
            context.succeed(data.Item.userId);
        }
    });

};