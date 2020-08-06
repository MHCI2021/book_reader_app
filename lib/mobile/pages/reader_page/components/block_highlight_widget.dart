
import 'package:flutter/material.dart';

/// [BlockHighlightWidget] is simply a [RichText] split into 3 parts
///
/// 
///

@immutable
class BlockHighlightWidget extends StatelessWidget {


  const BlockHighlightWidget({
    Key key, 
    this.highlightColor=Colors.yellow,
    this.align= TextAlign.left, 
    @required this.textStyle,
    @required this.blocks,
    this.currentBlock=0,
    this.padding=10
    }) : super(key: key);


    final TextAlign align;
    final TextStyle textStyle;
    final int currentBlock;
    final List<String> blocks;
    final Color highlightColor;
    final int padding;


  @override
  Widget build(BuildContext context) {
    return RichText(
    overflow: TextOverflow.clip,
    textAlign: align,
    text: TextSpan(
      children: [
          TextSpan( text:'\n'*padding+blocks.sublist(0, currentBlock).join(),style:textStyle),
           TextSpan(text: blocks[currentBlock],style:textStyle.copyWith(backgroundColor: highlightColor,)),
           TextSpan(text: blocks.sublist(currentBlock+1).join(), style:textStyle )
      ]
      )
    );
  }
  
}
  
final String test = '''What is machine learning?&& You probably use it dozens of times
a day without even knowing it.&& Each time you do a web search on Google or
Bing, that works so well because their machine learning software
has figured out how to rank what pages.&& When Facebook or Apple's photo application
recognizes your friends in your pictures, that's also machine learning.&& Each time you read your email and a spam filter saves you from having
to wade through tons of spam, again,&& that's because your computer has learned
to distinguish spam from non-spam email.&& So, that's machine learning. There's a science of getting computers to
learn without being explicitly programmed.&& One of the research projects that I'm
working on is getting robots to tidy up the house.&& How do you go about doing that?&& Well what you can do is have the robot
watch you demonstrate the task and learn from that.&& The robot can then watch what objects
you pick up and where to put them and try to do the same thing
even when you aren't there.&& For me, one of the reasons I'm
excited about this is the AI, or artificial intelligence problem.&& Building truly intelligent machines, we can do just about anything that you or
I can do.&& Many scientists think the best way to
make progress on this is through learning algorithms called neural networks,&&
which mimic how the human brain works, and I'll teach you about that, too.&& In this class,
you learn about machine learning and get to implement them yourself.&& I hope you sign up on our website and
join us.''';