import json
import re
import urllib


class BusinessCard:
  
    def __init__(self, json):
        self.data = json
        self.lst = ''
        self.dct = {}
        self.card = None
        self.name = True
        
    def cleanup(self):
        digit = re.findall("text': u'[^\s\}\']+", resp)
        self.lst = [a[9:] for a in digit]

        self.categorize('@', 'email')
        self.categorize('.com', 'website')
        
        #print self.dct
        #print self.lst
        self.data = json.dumps(self.dct)
        return self.data
        
    def categorize(self, symbol ,variable):
        regex = re.compile(symbol)
        for a in self.lst:
            if regex.search(a) is not None:
                var = a
                self.lst.remove(a)
                self.dct[variable] = a
            elif len(a) == 5 and a.isdigit():
                self.dct['index'] = a
                self.lst.remove(a)
            elif self.name:
                params = a
                f = urllib.urlopen("https://api.genderize.io/?name={0}".format(params))
                string = f.read()
                reg = re.compile('count')
                if reg.search(string) is not None:
                    self.name= False
                    var = a
                    ix = self.lst.index(a)
                    #print "index " + str(ix)
                    self.dct['first name'] = a
                    self.dct['last name'] = self.lst[ix+1]
                    print (self.lst[ix+1])
                    self.lst.remove(a)
                    self.lst.remove(self.lst[ix+1])
                    print (self.lst)
            elif a[0].isdigit() and len(a) >= 9:
                string  = ''.join(c for c in s if c.isdigit())
                if len(string) == 10 or len(string) == 11:
                    if 'number1' not in self.dct:
                        self.dct['number1'] = string
                        self.lst.remove(a)
                        #print self.lst
                    else:
                        self.dct['number2'] = string
                        self.lst.remove(a)