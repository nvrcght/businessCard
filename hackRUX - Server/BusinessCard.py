class BusinessCard:
  
    def __init__(self, lst):
        self.lst = lst
        self.dct = {}
        self.card = None
        self.name = True
        
    def cleanup(self):
        #digit = re.findall("[^\s\}\']+", resp)
        #self.lst = [a[9:] for a in digit]
        print " list " + str(self.lst)
        self.categorize()
        #self.categorize('.com', 'website')

        return self.dct
        
    def categorize(self):
        #regex = re.compile(symbol)
        for word in self.lst:
            lower = word.lower()
            if '@' in lower:
                """line = lower.split()
                if len(line) > 1:
                    lower = ''.join(c for c in line if '@' in line)
                    print "LOWER " + lower"""
                self.dct['email'] = lower
                
            elif 'com' in lower:
                if " " in lower:
                    lower = lower.replace(" ",".")
                self.dct['website'] = lower
                
                
            elif sum(char.isdigit() for char in word)  >= 9:
                if not all(char.isdigit() for char in word):
                    string  = ''.join(c for c in word if c.isdigit())
                if len(string) == 10 or len(string) == 11:
                    if 'number' not in self.dct:
                        self.dct['number'] = string
                    else:
                        self.dct['number2'] = string
            elif len(word) > 6 and sum(char.isdigit() for char in word) >=1:
                if'address' not in self.dct: #address
                    self.dct['address'] = word
            elif sum(char.isdigit() for char in word) == 5: #index
                this_ix = self.lst.index(word)
                if 'address' in self.dct:
                    current = self.dct['address']
                    #first_ix = self.lst.index(current)
                #for i in range(first_ix+1,this_ix+1):
                    #self.dct['address'] + " " + (self.lst[i])
            else:
                line = lower.split()
                if all(char.isalpha() for char in line):
                    if len(line) == 2:
                        if 'first_name' not in self.dct:
                            self.dct['first_name'] = line[0]
                            self.dct['last_name'] = line[1]
                        elif 'position' not in self.dct: #position
                            self.dct['position'] = lower
                    elif len(line) == 1 or len(line) > 2:
                        if 'position' not in self.dct:
                            self.dct['position'] = lower
