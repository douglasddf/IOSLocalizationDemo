# IOSLocalizationDemo
Demonstrates an approach to internationalization use with centralized files.

You can use a strategy to keep your XIBs or Storyboards in single file and locate visual 
components them on demand, programmatically making.

I believe that with a few steps you can assess whether the strategy is valid for what you need:

- Configure your project in the languages you want to support;

[![enter image description here][1]][2]

- Create a file to support Location;

[![enter image description here][3]][4]

- With the created file, add the target language, then Xcode will create a file for each language and you can put your keys and translation values.

[![enter image description here][5]][6]

- Create your visual component inherited from its target;

[![enter image description here][7]][8]

If you customize a visual component (such as UILabel), override the method can 'drawRect' and dynamically replace the key placed in the text field. So you can keep the common design for all screens without the worry of maintaining more than one layout for internationalization.


    - (void)drawRect:(CGRect)rect {
        NSString *text = NSLocalizedStringWithDefaultValue([self text], nil, [NSBundle mainBundle], [self text], @"");
        if (self.attributedText && [[self text] length] > 0) {
            
            NSDictionary *attributes = [(NSAttributedString *)self.attributedText attributesAtIndex:0
                                                                                     effectiveRange:NULL];
            [self setText:text];
            self.attributedText = [[NSAttributedString alloc] initWithString:self.text attributes:attributes];
        }else{
            [self setText:text];
        }
        
        [super drawRect:rect];
    }


When you run your project now note that the UILabel component will dynamically set the key value as you set the property of their XIB or Storyboard.

[![enter image description here][9]][9]

General helps:

- [http://www.raywenderlich.com/64401/internationalization-tutorial-for-ios-2014][10]
- [http://www.appcoda.com/ios-programming-tutorial-localization-apps/][11]

### An article tutorial (in portuguese)
<script async src="https://static.medium.com/embed.js"></script><a class="m-story" data-collapsed="true" href="https://medium.com/@douglasddf/language-localization-em-projetos-ios-2bbfa8c4d5df">Language Localization em projetos iOS</a>

  [1]: http://i.stack.imgur.com/yioMS.png
  [2]: http://i.stack.imgur.com/yioMS.png
  [3]: http://i.stack.imgur.com/fEQaK.png
  [4]: http://i.stack.imgur.com/fEQaK.png
  [5]: http://i.stack.imgur.com/eOeN2.png
  [6]: http://i.stack.imgur.com/eOeN2.png
  [7]: http://i.stack.imgur.com/CKgtP.png
  [8]: http://i.stack.imgur.com/CKgtP.png
  [9]: http://i.stack.imgur.com/EdRT2.png
  [10]: http://www.raywenderlich.com/64401/internationalization-tutorial-for-ios-2014
  [11]: http://www.appcoda.com/ios-programming-tutorial-localization-apps/
