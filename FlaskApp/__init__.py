from flask import Flask, jsonify
import uuid
from datetime import datetime
import hmac
import sha
import base64

app = Flask(__name__)

tasks = [
    {
        'id': 1,
        'title': u'Buy groceries',
        'description': u'Milk, Cheese, Pizza, Fruit, Tylenol', 
        'done': False
    },
    {
        'id': 2,
        'title': u'Learn Python',
        'description': u'Need to find a good Python tutorial on the web', 
        'done': False
    }
]

@app.route('/bcard/api/v1.0/parse_photo', methods=['GET'])
def get_photo_parsed():
    return jsonify({'tasks': tasks})

@app.route('/bcard/api/v1.0/upload_photo', methods=['GET', 'POST'])
def upload_photo():
    # DO NOT PASS BACK SECRET!
    _S3_SECRET = "7C4t44tSIKuKUrN/oSQsth99W4alneiKtl7lA+P/"
    _S3_ACCESS_KEY = "AKIAJ2KVSL32RHYXT5NQ"
    _S3_BUCKET_NAME = "bcardphotos"
    filename = str(uuid.uuid4()) +".jpeg" #TODO: Support for other non-jpeg file types
    content_type = "image/jpeg"


    now = datetime.utcnow()
    date_string = now.strftime("%a, %d %b %Y %H:%M:%S +0000")
    full_pathname = '/%s/images/%s' % (_S3_BUCKET_NAME, filename)
    string_to_sign = "PUT\n\n%s\n%s\n%s" % (content_type, date_string, full_pathname)
    h = hmac.new(_S3_SECRET, string_to_sign, sha)
    auth_string = base64.encodestring(h.digest()).strip()

    output = { "bucket_name": _S3_BUCKET_NAME,
        "filename": filename,
        "full_pathname" : full_pathname,
        "date_string" : date_string,
        "auth_string" : auth_string,
        "content_type" : content_type,
        "s3_key" : _S3_ACCESS_KEY,
    }
    return jsonify({'photo': output})


if __name__ == "__main__":
    app.run(debug=True)
