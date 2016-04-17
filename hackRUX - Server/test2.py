from BusinessCard import BusinessCard
import base64
import httplib2

from googleapiclient import discovery
from oauth2client.client import GoogleCredentials
DISCOVERY_URL='https://{api}.googleapis.com/$discovery/rest?version={apiVersion}'

def OCR(photo_file):
    """Run a label request on a single image"""
    #print photo_file
    credentials = GoogleCredentials.get_application_default()
    service = discovery.build('vision', 'v1', credentials=credentials,
                              discoveryServiceUrl=DISCOVERY_URL)

    with open(photo_file, 'rb') as image:
        image_content = base64.b64encode(image.read())
        service_request = service.images().annotate(body={
            'requests': [{
                'image': {
                    'content': image_content.decode('UTF-8')
                },
                'features': [{
                    'type': 'TEXT_DETECTION',
                    'maxResults': 1
                }]
            }]
        })
        response = service_request.execute()
        line = response['responses'][0]['textAnnotations'][0]['description']
        string =str(line)
        proc = string.splitlines()
        #print proc
        card = BusinessCard(proc)
        #print response
        #label = response['responses'][0]['labelAnnotations'][0]['description']
        #print('Found label: %s for %s' % (label, photo_file))
        return card.cleanup()
"""if __name__ == '__main__':
    #parser = argparse.ArgumentParser()
    #parser.add_argument('image_file', help='The image you\'d like to label.')
    #args = parser.parse_args()
    resp = main('pic.jpg')"""
