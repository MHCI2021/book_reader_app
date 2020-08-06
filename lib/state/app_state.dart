import 'package:flutter/material.dart';
import 'package:scroll_book/models/book.dart';
import 'package:scroll_book/models/user.dart';
import 'package:scroll_book/utils/fonts.dart';
enum Overlays {
  BookOptions,
  ScrollSpeed,
  Highlight,
  FontSize
}

class AppState extends ChangeNotifier {
  Map userProfileData;
  
  bool isPlaying = false;
  String fontFam='Alegreya Sans';
  double progress, fontSize=16.0;
  UserModel currentUser, userProfile;
  LibraryBook _currentBook;
  //List<LibraryBook> libBooks;



  AppState();
  //BookModel get currentBook=>;
  LibraryBook get currentBook=>_currentBook;
  //libBooks[0];

  play(){if(!isPlaying){isPlaying=true; notifyListeners();}}
  pause(){if(isPlaying){isPlaying=false; notifyListeners();}}


  Map getProfileData() => userProfileData ?? {};
  TextStyle get currentTextStyle=>getGoogleFonts[fontFam](TextStyle(fontSize: 16.0, color: Colors.black));
  init()async {
    //cOXfQtu96Drok7c01qh1
    //var dummyUser =  await Firestore.instance.collection('users').document('cOXfQtu96Drok7c01qh1').get();
    //currentUser = UserModel.fromFirebase( dummyUser.documentID, dummyUser.data);
    currentUser =c;
    
   // libBooks = currentUser.library;
  }
  String getText(){
    return "";
  }
  List<LibraryBook> getInProgressBooks()=>c.library.where((element) => element.isStarted).toList()??[];
  List<LibraryBook> getToStartBooks() =>c.library.where((element) => !element.isStarted).toList()??[];
  setBook(LibraryBook _newBook)=>_currentBook=_newBook;
  getTextBlocks()=>_currentBook.chapterText.split(". ");
  
}

UserModel c = UserModel(
  email: "cshannon@gmail.com", 
  username: null,
  firstName: "Connor",
  lastName: "Shannon",
  library: [
    LibraryBook(
      bookID:"learn",
      title: "How Buildings Learn",
      author: "Stewart Brand",
      imageUrl: "https://img1.od-cdn.com/ImageType-400/1523-1/1FA/701/FE/%7B1FA701FE-EC71-4D4E-805D-04F4CCA4E23E%7DImg400.jpg",
      isDone: false,
      isStarted: true,
      progress: 0.3,
      wordCount: 45040,// todo
      chapterNum: 2,
      chapterSentenceNum: 20,
      chapterText: learn,
      bookmarks: [
      ]
    ),
    LibraryBook(
      bookID: "ruined",
      title: "Ruined By Design",
      author: "Mike Montero",
      imageUrl: "https://m.media-amazon.com/images/I/41P0vehqsRL.jpg",
      isDone: false,
      isStarted: true,
      progress: 0.5,
      wordCount: 45040,// todo
      chapterNum: 1,
      chapterSentenceNum: 10,
      chapterText: designers,
      bookmarks: [
      ]
    ),

    LibraryBook(
      bookID: "sprint",
      title: "Sprint",
      author: "Jake Knapp",
      imageUrl: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1447560400l/27831864._SY475_.jpg",
      isDone: false,
      isStarted: false,
      progress: 0.3,
      wordCount: 45040,// todo
      chapterNum: 4,
      chapterSentenceNum: 5,
      chapterText: sprint,
      bookmarks: [
      ]
    ),
    LibraryBook(
      bookID: "culture",
      title: "Culture Code",
      author: "Daniel Coyle",
      imageUrl: "https://www.porchlightbooks.com/globalassets/book-covers/9780804176989.jpg?w=1000&scale=both&mode=crop&u=637045000342670000",
      isDone: false,
      isStarted: false,
      progress: 0.3,
      wordCount: 45040,// todo
      chapterNum: 4,
      chapterSentenceNum: 5,
      chapterText: sprint,
      bookmarks: [
      ]
    ),
  ]
  );


List<BookModel> storeBooks = [
    BookModel(
      id: "ruined",
      title: "Ruined By Design",
      author: "Mike Montero",
      imageUrl: "https://m.media-amazon.com/images/I/41P0vehqsRL.jpg",
      previewText: designerPreview,
     ),
  BookModel(
    id: "sprint",
    title: "Sprint",
    author: "Jake Knapp",
    imageUrl: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1447560400l/27831864._SY475_.jpg",
    previewText: sprintPreview,
      ),
  BookModel(
    id:"learn",
    title: "How Buildings Learn",
    author: "Stewart Brand",
    imageUrl: "https://img1.od-cdn.com/ImageType-400/1523-1/1FA/701/FE/%7B1FA701FE-EC71-4D4E-805D-04F4CCA4E23E%7DImg400.jpg",
    previewText: learnPreview,
    
     ),
    BookModel(
      id:"blindspot",
      title: "Blindspot",
      author: "",
      imageUrl: "",
      previewText: blindspotPreview,
    ),
    BookModel(
      id:"culture",
      title: "Culture Code",
      author: "Daniel Coyle",
      imageUrl: "",
      previewText: cultureCodePreview,
    ),

];
final String designerPreview='''WE ARE GATEKEEPERS
Victor Papanek, who offered us a path toward developing spines in Design for the Real World, referred to designers as gatekeepers. He reminded us of our power, our agency, and our responsibility. He reminded us that labor without counsel is not design. We have a skill-set that people need in order to get things made, and that skill-set includes an inquiring mind and a strong spine. We need to be more than a pair of hands. And we certainly can’t become the hands of unethical men.
As Victor said, “The only important thing about design is how it relates to people.”
We are gatekeepers. Nothing should be making it through the gate without our labor and our counsel. We are responsible for the effects of our work once it makes it out into the world. What passes through that gate carries our seal of approval. It carries our name. We are the defense against monsters. Sure, everyone remembers Frankenstein’s monster, but they call it by his maker’s name. The worst of what we create will outlive us.
There’s no longer room in Silicon Valley to ask why. Companies task designers to move fast and break things. How has become more important than why. How fast can we make this? How can we grab the most market share? How can we beat our competitors to market? (For those of you thinking that I’m generalizing and that your company is different — I am, and yours may be.  I look forward to you going to work every day, turning your company into an ethical utopia, and making a liar out of me.)
The current generation of designers have spent their careers learning how to work faster and faster and faster. While there’s certainly something to be said for speed, excessive speed tends to blur one’s purpose.
Excessive speed gets products through that gate before anyone notices what they are and how foul they smell. When we move fast, we break things. It’s one thing to break a database, but when that database holds the keys to intimate relationships and the names of two thousand caged babies, the database isn’t the only thing that breaks.
Along with speed, we’ve had to deal with the amphetamine of scale. Everything needs to be faster and also bigger. It’s no longer good enough to be the best in your category. You need to destroy all your competition, burn the sky, and view your competitor as an enemy. That is, until the day you buy them for parts.
When we move fast and break things and those things get bigger and bigger, the rubble falls everywhere, destroying communities and the rising dust blots out the sun.
Again, Facebook claims to have two billion users. (What percentage of those users are Russian bots is currently up for debate.) But as I mentioned earlier, one percent of two billion is twenty million. When you’re moving fast and breaking things—this is Facebook’s internal motto, by the way—one percent is well within the acceptable margin of error for rolling out new work. Technology companies call these people edge cases, but when your edge case contains twenty million people, you need to be careful about what you’re breaking. The cavalier attitude of “moving fast and breaking things” is deadly at that scale.
We need to measure more than profit. We need to slow down and measure what our work is doing out there in the world. We need to measure impact on the people whose lives we’re affecting. Then, we need to design things that improve the lives of the people who make them and the people who use them; design things which have a positive impact on society at large.
Twitter saved itself from bankruptcy by allowing fascists to run free and by allowing a seventy-two year-old racist xenophobe to break every single one of its rules because he was bringing them engagement. In 2018, it paid off financially. Twitter finally had its first profitable quarter!14 Jack Dorsey, who is technically an invertebrate, was vindicated. His strategy of turning a blind eye to harassment and abuse while building a giant bullhorn for outrage and white supremacy had paid off. Wall Street was happy. Shareholders were happy. Investors were happy. But children were in cages, immigrants were terrified, and decent people like Heather Heyer15 were being murdered by the goons Donald Trump was dog-whistling from that platform.
Twitter’s profitable quarter came at the expense of democracy, decency, and the safety of the world. Sadly, Jack didn’t use his newfound profits to buy himself a spine, but rather a shovel to dig himself in deeper. Shortly after being rewarded for designing a garbage fire, he was once again talking about how this time he was serious about cutting down the abuse. It had all the believability of Donald Trump promising to look into election meddling. People don’t see the things they’re rewarded for as problems to fix.
And as much as I’d like to put that entire disgrace at Jack Dorsey’s feet, and heaven knows he deserves it, he simply couldn’t have executed that plan without the help of everyone working for him. Every single employee working at Twitter in the last few years saw exactly where it was headed—if they didn’t, it’s because they weren’t looking. While I don’t doubt there were a few people trying to right the ship from the inside, you simply cannot correct a problem that management doesn’t see as a problem. As Upton Sinclair so eloquently put it:
It is difficult to get a man to understand something when his salary depends upon his not understanding it.
Twitter never wanted to understand the problem. Their salaries depended on them not understanding the problem. If Twitter believed it had any kind of problem, it was a public relations problem.
Twitter employees bore a responsibility to ask “why” and to say “no.” When they agreed to work at the company, their job wasn’t just to build a tool for the company, but also to understand how the company worked, and to make sure it didn’t work in a way that was detrimental to society. This is a burden all designers share, no matter where we choose to work. It’s part of the job. For the record, these aren’t answers I expect designers to come up with by themselves, but through asking questions and working collaboratively.
In February of 2017, after I’d been badgering him for months, Jack Dorsey agreed to meet me in person. Oddly, he agreed to meet me at Square, his other company. (My dad had a bumper sticker on the family Volaré that said “My other car is a Cadillac” so I totally get it.) We had a civil discussion. He was a gracious host, and I was a gracious guest. I asked him how he justified keeping Donald Trump on Twitter. I asked him how he justified not banning known white supremacists like David Duke and Mike Cernovich. In both cases, he gave me the free speech spiel he has memorized. He also told me there was a plan to deal with it, but they had to get it right. There was going to be a magical algorithm that took care of everything. He didn’t say magical. That’s my take. Jack was looking for a magical formula to fix everything. All at once. Without having to get his hands dirty. The fascists would get kicked out as soon as Twitter launched the algorithm that magically fixed anything. His approach was as passive as that sentence. Jack’s main priority was making sure he couldn’t be accused of having made a decision. His obsession with remaining impartial has made him impotent to act, even on the side of decency. He wants to be able to cast blame on an algorithm, rather than his own actions. That way he wouldn’t have any blood on his hands.
Except the blood is already there. It's all over the people who’ve been silenced. How is it free speech when it silences so many? I’m all for protecting free speech. Let’s start by amplifying the voices of those who’ve been silenced, not protecting the voices of those who’ve silenced them. A system that protects bullies isn’t a system we should be putting our labor into.
An algorithm is not a spine.
''';

final String designers = '''WE ARE GATEKEEPERS
Victor Papanek, who offered us a path toward developing spines in Design for the Real World, referred to designers as gatekeepers. He reminded us of our power, our agency, and our responsibility. He reminded us that labor without counsel is not design. We have a skill-set that people need in order to get things made, and that skill-set includes an inquiring mind and a strong spine. We need to be more than a pair of hands. And we certainly can’t become the hands of unethical men.
As Victor said, “The only important thing about design is how it relates to people.”
We are gatekeepers. Nothing should be making it through the gate without our labor and our counsel. We are responsible for the effects of our work once it makes it out into the world. What passes through that gate carries our seal of approval. It carries our name. We are the defense against monsters. Sure, everyone remembers Frankenstein’s monster, but they call it by his maker’s name. The worst of what we create will outlive us.
There’s no longer room in Silicon Valley to ask why. Companies task designers to move fast and break things. How has become more important than why. How fast can we make this? How can we grab the most market share? How can we beat our competitors to market? (For those of you thinking that I’m generalizing and that your company is different — I am, and yours may be.  I look forward to you going to work every day, turning your company into an ethical utopia, and making a liar out of me.)
The current generation of designers have spent their careers learning how to work faster and faster and faster. While there’s certainly something to be said for speed, excessive speed tends to blur one’s purpose.
Excessive speed gets products through that gate before anyone notices what they are and how foul they smell. When we move fast, we break things. It’s one thing to break a database, but when that database holds the keys to intimate relationships and the names of two thousand caged babies, the database isn’t the only thing that breaks.
Along with speed, we’ve had to deal with the amphetamine of scale. Everything needs to be faster and also bigger. It’s no longer good enough to be the best in your category. You need to destroy all your competition, burn the sky, and view your competitor as an enemy. That is, until the day you buy them for parts.
When we move fast and break things and those things get bigger and bigger, the rubble falls everywhere, destroying communities and the rising dust blots out the sun.
Again, Facebook claims to have two billion users. (What percentage of those users are Russian bots is currently up for debate.) But as I mentioned earlier, one percent of two billion is twenty million. When you’re moving fast and breaking things—this is Facebook’s internal motto, by the way—one percent is well within the acceptable margin of error for rolling out new work. Technology companies call these people edge cases, but when your edge case contains twenty million people, you need to be careful about what you’re breaking. The cavalier attitude of “moving fast and breaking things” is deadly at that scale.
We need to measure more than profit. We need to slow down and measure what our work is doing out there in the world. We need to measure impact on the people whose lives we’re affecting. Then, we need to design things that improve the lives of the people who make them and the people who use them; design things which have a positive impact on society at large.
Twitter saved itself from bankruptcy by allowing fascists to run free and by allowing a seventy-two year-old racist xenophobe to break every single one of its rules because he was bringing them engagement. In 2018, it paid off financially. Twitter finally had its first profitable quarter!14 Jack Dorsey, who is technically an invertebrate, was vindicated. His strategy of turning a blind eye to harassment and abuse while building a giant bullhorn for outrage and white supremacy had paid off. Wall Street was happy. Shareholders were happy. Investors were happy. But children were in cages, immigrants were terrified, and decent people like Heather Heyer15 were being murdered by the goons Donald Trump was dog-whistling from that platform.
Twitter’s profitable quarter came at the expense of democracy, decency, and the safety of the world. Sadly, Jack didn’t use his newfound profits to buy himself a spine, but rather a shovel to dig himself in deeper. Shortly after being rewarded for designing a garbage fire, he was once again talking about how this time he was serious about cutting down the abuse. It had all the believability of Donald Trump promising to look into election meddling. People don’t see the things they’re rewarded for as problems to fix.
And as much as I’d like to put that entire disgrace at Jack Dorsey’s feet, and heaven knows he deserves it, he simply couldn’t have executed that plan without the help of everyone working for him. Every single employee working at Twitter in the last few years saw exactly where it was headed—if they didn’t, it’s because they weren’t looking. While I don’t doubt there were a few people trying to right the ship from the inside, you simply cannot correct a problem that management doesn’t see as a problem. As Upton Sinclair so eloquently put it:
It is difficult to get a man to understand something when his salary depends upon his not understanding it.
Twitter never wanted to understand the problem. Their salaries depended on them not understanding the problem. If Twitter believed it had any kind of problem, it was a public relations problem.
Twitter employees bore a responsibility to ask “why” and to say “no.” When they agreed to work at the company, their job wasn’t just to build a tool for the company, but also to understand how the company worked, and to make sure it didn’t work in a way that was detrimental to society. This is a burden all designers share, no matter where we choose to work. It’s part of the job. For the record, these aren’t answers I expect designers to come up with by themselves, but through asking questions and working collaboratively.
In February of 2017, after I’d been badgering him for months, Jack Dorsey agreed to meet me in person. Oddly, he agreed to meet me at Square, his other company. (My dad had a bumper sticker on the family Volaré that said “My other car is a Cadillac” so I totally get it.) We had a civil discussion. He was a gracious host, and I was a gracious guest. I asked him how he justified keeping Donald Trump on Twitter. I asked him how he justified not banning known white supremacists like David Duke and Mike Cernovich. In both cases, he gave me the free speech spiel he has memorized. He also told me there was a plan to deal with it, but they had to get it right. There was going to be a magical algorithm that took care of everything. He didn’t say magical. That’s my take. Jack was looking for a magical formula to fix everything. All at once. Without having to get his hands dirty. The fascists would get kicked out as soon as Twitter launched the algorithm that magically fixed anything. His approach was as passive as that sentence. Jack’s main priority was making sure he couldn’t be accused of having made a decision. His obsession with remaining impartial has made him impotent to act, even on the side of decency. He wants to be able to cast blame on an algorithm, rather than his own actions. That way he wouldn’t have any blood on his hands.
Except the blood is already there. It's all over the people who’ve been silenced. How is it free speech when it silences so many? I’m all for protecting free speech. Let’s start by amplifying the voices of those who’ve been silenced, not protecting the voices of those who’ve silenced them. A system that protects bullies isn’t a system we should be putting our labor into.
An algorithm is not a spine.
The boy kings of Silicon Valley love a good algorithm—they’ve designed some great ones over the years. But there are problems even the best math can’t solve. There are times when you physically have to walk over to a server and pull the plug. I get why they want an algorithm to do it—lack of accountability. Intentionally pulling the plug on someone who’s trolling women on your service is a decision. It requires agency, leadership, and a point of view. But should that troll get caught in an algorithm? Well, that’s a different matter. There was no intent to specifically get rid of that person. A good algorithm is the equivalent of breaking up with someone over a text message and then turning your phone off. It’s cowardly. Good leaders should aspire to have their fingerprints all over hard decisions.
By the way, I offered to walk over and turn off Trump’s account myself. Jack didn’t take me up on it.
My dad has a small garden out back. In his old age, he’s decided to grow things. Tomatoes, zucchini, cabbage, the assortment of herbs… standard stuff. A few years ago, he called me all pissed off because foxes have attacked his garden.
“What are you gonna do?”
“Put up a fence.”
That’s exactly what he did. He put up a fence. The foxes figured out how to get under the fence. He then dug a moat and filled it with concrete. The foxes found another way in. His neighbors, who are used to my Dad going to war with the local wildlife, suggested poison.
  “I don't want to kill them. I just don’t want them in my damn garden!”
My dad understood that if he ever wanted a tomato out of that garden he had to fight tooth and nail every day. He had to be vigilant. He had to adapt. He fought foxes. He fought weeds. There were probably a few groundhogs mixed in there. But he understood that garden required tending to grow. Most importantly, he understood he was responsible for bringing the seeds he planted to fruit. He never did manage to keep the foxes out completely, but he stayed vigilant enough that he remained a step ahead of them.
Last time I was at my folks’ house, my dad made a salad. Told me everything in it came from his garden.
“These tomatoes are delicious dad.”
“Best fucking tomatoes you ever ate.”
They were indeed.''';


final String blindspotPreview = '''1
Mindbugs
IT
IS AN ORDINARY DAY ON A COLLEGE CAMPUS.
STUDENTS AND professors of experimental psychology have filed into a lecture hall to listen to a
distinguished visiting scientist explain how our minds perceive the
physical world. Nothing about his tweed jacket and unkempt hair
suggests the challenge he is about to deliver. A few minutes into the
lecture, he says matter-of-factly, “As you can plainly see, the two
tabletops are exactly the same in shape and size.”
Shuffling in their seats, some in the audience frown while others
smile in embarrassment because, as anyone can plainly see, he is dead
wrong. Some tilt their heads from side to side, to test if a literal shift
in perspective will help. Others wonder whether they should bother
staying for the lecture if this nonsense is just the start.
The nonbelievers are caught short, though, when the speaker
proceeds to show the truth of his audacious claim. Using an overhead
projector, he takes a transparent plastic sheet containing only a single
red parallelogram, lays it over the tabletop on the left, and shows that
it fits perfectly. He then rotates the plastic sheet clockwise, and places
the parallelogram over the tabletop on the right; it fits perfectly there
as well. An audible gasp fills the hall as the speaker moves the red
frame back and forth, and the room breaks into laugher. With nothing
more than a faint smile the speaker goes on to complete his lecture on how the eye receives, the brain registers, and the mind interprets visual information.
Unconvinced? You can try the test yourself. Find some paper thin
enough to trace the outline of one of the tabletops, and then move the
outline over to the other tabletop. If you don’t find that the shape of
the first tabletop fits identically onto the second tabletop, there can
be only one explanation—you’ve botched the tracing job, because the
table surfaces are precisely the same. But how can this be?
''';


final String blindspot = '''
1
Mindbugs
IT
IS AN ORDINARY DAY ON A COLLEGE CAMPUS.
STUDENTS AND professors of experimental psychology have filed into a lecture hall to listen to a
distinguished visiting scientist explain how our minds perceive the
physical world. Nothing about his tweed jacket and unkempt hair
suggests the challenge he is about to deliver. A few minutes into the
lecture, he says matter-of-factly, “As you can plainly see, the two
tabletops are exactly the same in shape and size.”
Shuffling in their seats, some in the audience frown while others
smile in embarrassment because, as anyone can plainly see, he is dead
wrong. Some tilt their heads from side to side, to test if a literal shift
in perspective will help. Others wonder whether they should bother
staying for the lecture if this nonsense is just the start.
The nonbelievers are caught short, though, when the speaker
proceeds to show the truth of his audacious claim. Using an overhead
projector, he takes a transparent plastic sheet containing only a single
red parallelogram, lays it over the tabletop on the left, and shows that
it fits perfectly. He then rotates the plastic sheet clockwise, and places
the parallelogram over the tabletop on the right; it fits perfectly there
as well. An audible gasp fills the hall as the speaker moves the red
frame back and forth, and the room breaks into laugher. With nothing
more than a faint smile the speaker goes on to complete his lecture on how the eye receives, the brain registers, and the mind interprets visual information.
Unconvinced? You can try the test yourself. Find some paper thin
enough to trace the outline of one of the tabletops, and then move the
outline over to the other tabletop. If you don’t find that the shape of
the first tabletop fits identically onto the second tabletop, there can
be only one explanation—you’ve botched the tracing job, because the
table surfaces are precisely the same. But how can this be?
VISUAL MINDBUGS
YOU, LIKE US, have just succumbed to a famous visual illusion, one that produces an error in the mind’s ability to perceive a pair of objects as they actually are. We will call such errors mindbugs—ingrained habits
of thought that lead to errors in how we perceive, remember, reason,
and make decisions.1
The psychologist Roger Shepard, a genius who has delighted in the
art of confounding, created this illusion called Turning the Tables.
When we look at the images of the two table surfaces, our retinas do,
in fact, receive them as identical in shape and size. In other words,
the retina “sees” the tabletops quite accurately. However, when the
eye transmits that information to the brain’s visual cortex, where
depth is perceived, the trouble begins.
The incorrect perception that the two tabletops are strikingly
different in shape occurs effortlessly, because the brain automatically
converts the 2-D image that exists both on the page and on the retina
into a 3-D interpretation of the tabletop shapes as they must be in the
natural world. The automatic processes of the mind, in other words,
impose the third dimension of depth onto this scene. And the
conscious, reflective processes of the mind accept the illusion
unquestioningly. So much so that when encountering the speaker’s
assertion that the tabletop outlines are the same, the conscious mind’s
first reaction is to consider it to be sheer nonsense.
Natural selection has endowed the minds of humans and other large
animals to operate successfully in a three-dimensional world. Having
no experience in a world other than a 3-D one, the brain we have
continues to perform its conscious perceptual corrections of the tables’ dimensions to make them appear as they would in the
traditional 3-D world.2
Contrary to expectation, this error reflects not a weakness of
adaptation but rather a triumph, for Shepard’s tabletops highlight the
success of a visual system that has adapted effectively to the
combination of a two-dimensional retina inside the eye and a threedimensional world outside. The mind’s automatic understanding of
the data is so confident that, as Shepard puts it, “any knowledge or
understanding of the illusion we may gain at the intellectual level
remains virtually powerless to diminish the magnitude of the
illusion.” Take a look at the tables again. The knowledge you now
have (that the tables have identical surfaces) has no corrective effect
in diminishing the illusion!3
Disconcerting as this experience is, it serves as a vivid illustration of
a signal property of the mind—it does a great deal of its work
automatically, unconsciously, and unintentionally. Mention of the
mind’s unconscious operation may summon up for you a visual
memory of the bearded, cigar-smoking Sigmund Freud, who rightly
gets credit for having brought the term unconscious into everyday use.
However, an understanding of the unconscious workings of the mind
has changed greatly in the century since Freud’s pathbreaking
observations. Freud portrayed an omniscient unconscious with
complex motives that shape important aspects of human mind and
behavior—from dreams to memories to madness, and ultimately to
civilization itself. Today, however, Freud’s arguments, detached as they have remained from scientific verification, have a greatly reduced impact on scientific understanding of unconscious mental life.
Instead, the modern conception of the unconscious mind must be credited to another historical figure, one far less known than Freud. A nineteenth-century German physicist and physiologist, Hermann von Helmholtz, offered the name unbewußter Schluß, or unconscious inference, to describe how an illusion like Shepard’s tabletops might work.4 Helmholtz aimed to describe the means by which the mind creates from physical data the conscious perceptions that define our ordinary and subjective experiences of “seeing.” Our visual system is capable of being tricked by a simple 2-D image, because an unconscious mental act replaces the 2-D shape of the retinal image with a consciously perceived 3-D shape of the inferred object it suggests. Now try this: Read the following sixteen words with sufficiently close attention so that you can expect to be able to recognize them when you see them again a few pages hence:
Ant Spider Feelers Web Fly
Poison Slimy Crawl Bee Wing
Bug Small Bite Fright Wasp Creepy
In the meantime, here’s another striking example of unconscious inference in the form of a checkerboard and cylinder to confound us. When we tell you that the squares marked A and B are exactly the same in their coloring, you will doubtless believe us to be wrong. But take a thick piece of opaque paper, one large enough to cover the
entire picture, mark with a point the two squares labeled A and B, and make a circular hole just a bit smaller than the checkerboard square on which each sits. When you look only through the holes and without the rest of the image, you will see that they are indeed identical in color.
Again the culprit is an unconscious inference, a mindbug that automatically goes to work on the image. What causes this remarkable failure of perception?

Several features of this checkerboard image are involved, but let us attend to the most obvious ones. First of all, notice that B is surrounded by several dark squares that make it look lighter than it is, merely by contrast;
likewise, just the opposite, A is surrounded by adjacent lighter squares that make it seem darker than it actually is. Second, notice
the shadow being cast by the cylinder. This darkens the squares within the shadow—including the one marked B—but the mind
automatically undoes this darkening to correct for the shadow, lightening our conscious experience of B.
As with the table illusion, the mechanisms that produce this one also exist to enable us to see and understand the world successfully.
Ted Adelson, a vision scientist at MIT and creator of this checkershadow image, writes: “As with many so-called illusions, this
effect really demonstrates the success rather than the failure of the visual system. The visual system is not very good at being a physical
light meter, but that is not its purpose.”5 Such examples force us to ask a more general question: To what extent has our mind designed
wonderfully efficient and accurate methods that fail us miserably when we put them to use in a slightly revised context?

''';




final String learnPreview = '''CHAPTER 1
Flow 
YEAR AFTER YEAR, the cultural elite of San Francisco is treated to the sight of its pre-eminent ladies, resplendently gowned, lined up in public waiting to pee. The occasion is intermission at the annual gala opening of the opera. The ground-floor ladies’ room at the Opera House is too small (the men’s isn’t). This has been the case since the place was built in 1932. As the women are lined up right next to the lobby bar, their plight has become a traditional topic of discussion. The complaints and jokes never change. Neither does the ladies’ room.
Between the world and our idea of the world is a fascinating kink. Architecture, we imagine, is permanent. And so our buildings thwart us. Because they discount time, they misuse time.
Almost no buildings adapt well. They’re designed not to adapt; also budgeted and financed not to, constructed not to, administered not to, maintained not to, regulated and taxed not to, even remodeled not to. But all buildings (except monuments) adapt anyway, however poorly, because the usages in
and around them are changing constantly. The problem is world-scale—the building industry is the second-largest in the world (after agriculture). Buildings contain our lives and all civilization. The problem is also intensely personal. If you look up from this book, what you almost certainly see is the inside of a building. Glance out a window and the main thing you notice is the outside of other buildings. They look so static.
Buildings loom over us and persist beyond us. They have the perfect memory of materiality. When we deal with buildings we deal with decisions taken long ago for remote reasons. We argue with anonymous predecessors and lose. The best we can hope for is compromise with the fait accompli of the building. The whole idea of architecture is permanence. University donors invest in “bricks and mortar” rather than professorial chairs because of the lure of a lasting monument. In wider use, the term “architecture” always means “unchanging deep structure.” It is an illusion. New usages persistently retire or reshape buildings. The old
church is torn down, lovely as it is, because the parishioners have gone and
no other use can be found for it. The old factory, the plainest of buildings,
keeps being revived: first for a collection of light industries, then for artists’
studios, then for offices (with boutiques and a restaurant on the ground floor),
and something else is bound to follow. From the first drawings to the final
demolition, buildings are shaped and reshaped by changing cultural currents,
changing real-estate value, and changing usage.
''';
final String learn ='''
CHAPTER 1
Flow
YEAR AFTER YEAR, the cultural elite of San Francisco is treated to the sight of its pre-eminent ladies, resplendently gowned, lined up in public waiting to pee. The occasion is intermission at the annual gala opening of the opera. The ground-floor ladies’ room at the Opera House is too small (the men’s isn’t). This has been the case since the place was built in 1932. As the women are lined up right next to the lobby bar, their plight has become a traditional topic of discussion. The complaints and jokes never change. Neither does the ladies’ room.
Between the world and our idea of the world is a fascinating kink. Architecture, we imagine, is permanent. And so our buildings thwart us. Because they discount time, they misuse time.
Almost no buildings adapt well. They’re designed not to adapt; also budgeted and financed not to, constructed not to, administered not to, maintained not to, regulated and taxed not to, even remodeled not to. But all buildings (except monuments) adapt anyway, however poorly, because the usages in
and around them are changing constantly. The problem is world-scale—the building industry is the second-largest in the world (after agriculture). Buildings contain our lives and all civilization. The problem is also intensely personal. If you look up from this book, what you almost certainly see is the inside of a building. Glance out a window and the main thing you notice is the outside of other buildings. They look so static.
Buildings loom over us and persist beyond us. They have the perfect memory of materiality. When we deal with buildings we deal with decisions taken long ago for remote reasons. We argue with anonymous predecessors and lose. The best we can hope for is compromise with the fait accompli of the building. The whole idea of architecture is permanence. University donors invest in “bricks and mortar” rather than professorial chairs because of the lure of a lasting monument. In wider use, the term “architecture” always means “unchanging deep structure.” It is an illusion. New usages persistently retire or reshape buildings. The old
church is torn down, lovely as it is, because the parishioners have gone and
no other use can be found for it. The old factory, the plainest of buildings,
keeps being revived: first for a collection of light industries, then for artists’
studios, then for offices (with boutiques and a restaurant on the ground floor),
and something else is bound to follow. From the first drawings to the final
demolition, buildings are shaped and reshaped by changing cultural currents,
changing real-estate value, and changing usage.
The word “building” contains the double reality. It means both “the action of
the verb BUILD” and “that which is built”—both verb and noun, both the
action and the result. Whereas “architecture” may strive to be permanent, a
“building” is always building and rebuilding. The idea is crystalline, the fact
fluid. Could the idea be revised to match the fact?
That’s the intent of this book. My approach is to examine buildings as a
whole—not just whole in space, but whole in time. Some buildings are
designed and managed as a spatial whole, none as a temporal whole. In the
absence of theory or standard practice in the matter, we can begin by
investigating: What happens anyway in buildings over time?
Two quotes are most often cited as emblems of the way to understand how
buildings and their use interact. The first, echoing the whole length of the
20th century, is “Form ever follows function.” Written in 1896 by Louis
Sullivan, the Chicago highrise designer, it was the founding idea of
Modernist architecture.1 The very opposite concept is Winston Churchill’s
“We shape our buildings, and afterwards our buildings shape us.”2 These
were clairvoyant insights, pointing in the right direction, but they stopped
short.

1981 - THE TRUE NATURE OF BUILDINGS—that they can’t hold still— is betrayed by a brick mansion on the move in Raleigh, North Carolina. The Capehart-Crocker house (1898) was moved to make room for a state government complex. The house is now used for offices. Sullivan’s form-follows-function misled a century of architects into believing
that they could really anticipate function. Churchill’s ringing and-then-theyshape-us truncated the fuller cycle of reality. First we shape our buildings, then they shape us, then we shape them again—ad infinitum. Function reforms form, perpetually.
“Flow, continual flow, continual change, continual transformation” is how a Pueblo Indian architectural historian named Rina Swentzel describes her
culture and her home village.3 That describes everyone’s culture and village.
In this century the houses of America and Europe have been altered utterly.
When servants disappeared from them, kitchens suddenly grew, and servant’s
rooms became superfluous and were rented out. Cars came, grew in size and
number, then shrank in size, and garages and car parks tried to keep pace.
“Family rooms” expanded around the television. In the 1960s, women joined
the work force, transforming both the workplace and the home. With shifting
economic opportunities and stresses, families fragmented so much that the
conventional nuclear family has become a rarity, and the design of housing is
still catching up with that.
Office buildings are now the largest capital asset of developed nations and
employ over half of their workforces. At the office, management theories
come and go, each with a different physical layout. Unremitting revolutions

in communication technology require rewiring of whole buildings every seven years on average. After the 1973 oil crisis, the energy budget of a building suddenly became a major issue, and windows, insulation, and heating and cooling systems had to be completely revamped toward energy efficiency.

1941 - RICH TO POOR? It looks at first glance like the prospects of this Coxsackie, New York, farm have gone downhill from left to right. I suspect that’s why my old photography teacher, John Collier, took the photo for the Farm Security Administration—as an illustration of the harsh effects of the Depression. But building historian Dell Upton bets that the middle part was built first, in the 1820s. Then the fancy part was added on the left in the 1830s, and the kitchen moved into its own addition to the right in the 1850s. BUILDINGS TELL STORIES, if they’re allowed—if their past is flaunted rather than concealed.
1990 - BLUE TO WHITE COLLAR. It was built as a valve factory in the
1930s in Emeryville, California. Now it houses 28 professional offices and
live/work spaces—software designers, architects, photographers, and a
magazine, The Monthly. When the factory at 1301 59th Street was gutted in
1985, a second floor was added throughout, providing 65,000 square feet
total. Freight trains still rumble through several times a day, but the area has
made the switch from dying-industrial to blooming-professional.

1972 - POOR TO RICH? No, stranger than that. After young Stephen W.
Dorsey was elected US Senator from Arkansas in 1874, he made a pile of
money with land and cattle speculation. In the remote northeast New Mexico
prairie he constructed a mansion to suit his fortune and fame. It began in
1878 with frontier-romantic logs (left) and then shifted to Gothic-romantic
sandstone (right) in 1881—complete with stone portraits on the upper tower
of Dorsey and his wife and brother, plus two gargoyles in the likeness of his
political enemy, Senator James Blaine. Dorsey got government contracts for
mail delivery which later were investigated for fraud—\$2 million had been
stolen. The trial ruined Dorsey, and the mansion was foreclosed in 1893.
Subsequent ranch families left the place as it was. It is now a house museum,
a monument to frontier chicanery.

1992 - LIKE A MOUSE IN A COW SKULL, one specialty makes a home in another specialty’s husk. Gas stations such as this one between the airport and the freeway in Albuquerque, New Mexico, are basically disposable buildings, left standing while the landlord waits for a big real estate score. Meanwhile, why not get some rent from the local karate club? It looks not bad as a dojo—lots of parking, and no neighbors to complain about the shouting.

Asbestos went from being very good for you to very bad for you. Fire codes and building codes discovered new things to worry about, and old buildings
were forced to meet the new standards. Access for the disabled transformed
toilets, stairs, curbs, elevators.
Deterioration is constant, in new buildings as much as old. The roof leaks.
The furnace is dying. The walls have cracks. The windows are a disgrace.
People are getting sick from something in the air conditioning. The whole
place is going to have to be redone!
And you can’t fix or remodel an old place in the old way. Techniques and
materials keep changing. Factory-hung windows and doors are better than the
old site-built ones, but they have different shapes. Sheetrock replaces plaster;
steel studs replace wood. You have to have vapor barriers, plastic plumbing,
plastic electrical fixtures, a dozen new forms of insulation, track lighting, task
lighting, uplighting, and carpet by the acre. The extent of change can be
documented in Architectural Graphic Standards, the American builder’s
bible for design and construction details. It was first published in 1932.

Selling in the hundreds of thousands, it was up to its eighth completely
revised edition in 1988—with only part of one of its 864 pages still the same
after 56 years. More than half of the 1988 edition was new or revised since the 1981 edition—seven routine years. More is being spent on changing buildings than on building new ones. At the end of the 1980s, one of the new preservation professionals, Sally Oldham, could report formidable statistics. Home renovation in America had more than doubled during the decade. Commercial rehabilitation expenditures had gone from three-fourths of new construction to one-and-a-half times new construction. Some \$200 billion (5 percent of the gross national product) was spent on renovation and rehabilitation in 1989, and historic preservation accounted for \$40 billion a year of goods and services.4 Nearly all architects (96 percent) were involved in some form of rehabilitation, and a quarter of architects’ revenues came from rehab. Buildings keep being pushed around by three irresistible forces—technology, money, and fashion. Technology offers, say, new double-pane insulated windows with a sun-reflective membrane—expensive, but they will save enormously on energy costs for the building, and you get political points for installing them. By the time their defects become intolerable, even newer windows will beckon. The march of technology is inexorable, and accelerating.
Form follows funding. If people have money to spare, they will mess with their building, at minimum to solve the current set of frustrations with the place, at maximum to show off their wealth, on the reasonable theory that money attracts money. A building is not primarily a building; it is primarily property, and as such, subject to the whims of the market. Commerce drives all before it, especially in cities. Wherever land value is measured in square feet, buildings are as fungible as cash. Cities devour buildings. As for fashion, it is change for its own sake—a constant unbalancing of the status quo, cruelest perhaps to buildings, which would prefer to remain just as they are, heavy and obdurate, a holdout against the times. Buildings are treated by fashion as big, difficult clothing, always lagging embarrassingly behind the mode of the day. This issue has nothing to do with function: fashion is described precisely as “non-functional stylistic dynamism” in Man’s Rage for Chaos by Morse Peckham.5 And fashion is culture-wide and inescapable.
''';


final String cultureCodePreview='''The Christmas Truce
Of all the difficult and dangerous battlefields in history, the Flanders trenches during the winter of 1914 might top the list. Military scholars tell us that this is due to the fact that World War I marked the historical intersection of modern weapons and medieval strategy.
But in truth, it was mostly due to the mud. The Flanders trenches were located below sea level, dug out of greasy clay so waterlogged that a rainstorm could transform them into canals. They were cold and miserable, an ideal breeding ground for rats, fleas, disease, and all manner of pestilence.
The worst part, however, was the closeness of the enemy. Opposing troops were only a few hundred feet apart in many points and occasionally much less. (At one place near Vimy Ridge, two observation posts stood seven meters apart.) Grenades and artillery were a constant threat; a carelessly lit match was an invitation for a sniper’s bullet. As future prime minister Harold Macmillan, then a lieutenant in the Grenadier Guards, wrote, “One can look for miles and see no human being. But in those miles of country lurk…it seems thousands, even hundreds of thousands of men, planning against each other perpetually some new device of death. Never showing themselves, they launch at each other bullet, bomb, aerial torpedo and shell.”

Beneath the mud resided deeper layers of historical hatred
between the Allies and the Germans. English and French newspapers
printed fervent myths about how German barbarians were melting
down innocent victims to make soap. For their part, German
schoolchildren were reciting Ernst Lissauer’s “Hymn of Hate,” which
was only slightly less subtle:
You we will hate with a lasting hate,
We will never forgo our hate,
Hate by water and hate by land,
Hate of the head and hate of the hand,
Hate of the hammer and hate of the crown,
Hate of seventy millions choking down.
We love as one, we hate as one,
We have one foe and one alone—
ENGLAND!
The war began in August. As the weeks and months passed, the
two sides systematically killed each other and were killed, the bodies
strewn in the barbed wire of no-man’s-land. As Christmas
approached, voices in distant capitals argued for a temporary ceasefire. In Rome, Pope Benedict appealed for holiday peace; in
Washington, D.C., a Senate resolution requested a twenty-day break
in the fighting. Military leaders on both sides swiftly deemed this
idea impossible and informed their troops to expect surprise attacks
on Christmas. Any soldier who attempted to create an illicit truce,
they warned, would be court-martialed.''';

final String cultureCode='''
The Christmas Truce
Of all the difficult and dangerous battlefields in history, the Flanders trenches during the winter of 1914 might top the list. Military scholars tell us that this is due to the fact that World War I marked the historical intersection of modern weapons and medieval strategy.
But in truth, it was mostly due to the mud. The Flanders trenches were located below sea level, dug out of greasy clay so waterlogged that a rainstorm could transform them into canals. They were cold and miserable, an ideal breeding ground for rats, fleas, disease, and all manner of pestilence.
The worst part, however, was the closeness of the enemy. Opposing troops were only a few hundred feet apart in many points and occasionally much less. (At one place near Vimy Ridge, two observation posts stood seven meters apart.) Grenades and artillery were a constant threat; a carelessly lit match was an invitation for a sniper’s bullet. As future prime minister Harold Macmillan, then a lieutenant in the Grenadier Guards, wrote, “One can look for miles and see no human being. But in those miles of country lurk…it seems thousands, even hundreds of thousands of men, planning against each other perpetually some new device of death. Never showing themselves, they launch at each other bullet, bomb, aerial torpedo and shell.”

Beneath the mud resided deeper layers of historical hatred
between the Allies and the Germans. English and French newspapers
printed fervent myths about how German barbarians were melting
down innocent victims to make soap. For their part, German
schoolchildren were reciting Ernst Lissauer’s “Hymn of Hate,” which
was only slightly less subtle:
You we will hate with a lasting hate,
We will never forgo our hate,
Hate by water and hate by land,
Hate of the head and hate of the hand,
Hate of the hammer and hate of the crown,
Hate of seventy millions choking down.
We love as one, we hate as one,
We have one foe and one alone—
ENGLAND!
The war began in August. As the weeks and months passed, the
two sides systematically killed each other and were killed, the bodies
strewn in the barbed wire of no-man’s-land. As Christmas
approached, voices in distant capitals argued for a temporary ceasefire. In Rome, Pope Benedict appealed for holiday peace; in
Washington, D.C., a Senate resolution requested a twenty-day break
in the fighting. Military leaders on both sides swiftly deemed this
idea impossible and informed their troops to expect surprise attacks
on Christmas. Any soldier who attempted to create an illicit truce,
they warned, would be court-martialed.
Then on Christmas Eve, something happened. It’s difficult to
determine precisely where it began, but it appeared to have been
spontaneous, occurring independently at several places along the
front. It started with songs. Some were Christmas carols; some were
military songs. In most places, the singing went back and forth for a
while, with each side applauding or jeering the other’s renditions.

Then something even stranger happened: The soldiers began to
climb out of their trenches and approach each other in a friendly
way. Outside a town called La Chapelle d’Armentières, English
soldiers heard a German voice call out, in English, “I am a
lieutenant! Gentlemen, my life is in your hands, for I am out of my
trench and walking toward you. Will one of your officers meet me
halfway?”
Rifleman Percy Jones figured it was a surprise attack. As he later
wrote:
We commenced polishing up ammunition and rifles and
getting all ready for speedy action. In fact we were about
to loose off a few rounds at the biggest light when…words
were heard (probably through a megaphone),
“Englishmen, Englishmen. Don’t shoot. You don’t shoot,
we don’t shoot.” Then followed a remark about Christmas.
This was all very well, but we had heard so many yarns
about German treachery that we kept a very sharp
lookout.
How it happened I don’t know, but shortly after this our
boys had lights out and the enemy troops were busy
singing each other’s songs, punctuated with terrific salvos
of applause. The scene from my sentry post was hardly
creditable. Straight ahead were three large lights, with
figures perfectly visible around them. The German
trenches…were illuminated with hundreds of little lights.
Far away to the left, where our lines bent, a few lights
showed our A Company trenches, where the men were
thundering out “My Little Grey Home in the West.” At the
conclusion…the Saxons burst into loud cheers and obliged
with some German tune. They also sang one of their
national airs to the tune of “God Save the King.” We
replied with the Austrian hymn, at which the applause
was terrific.

Back at British High Command, Field Marshal Sir John French
received puzzling reports that unarmed German soldiers were
“running from the German trenches across to ours, holding
Christmas trees above their heads.” French issued immediate orders
to “prevent any recurrence of such conduct, and called the local
commanders to strict account.” His orders had no effect. The truce
grew. The soldiers involved seemed to have no more idea why this
was happening than Sir John French did. They saw it happen and
participated in it, and it still felt utterly inexplicable. Diarists on both
sides would refer to the surreality of the event, many describing it as
kind of a waking dream.
For many years, historians assumed that the story of the Christmas
Truce was exaggerated, an isolated instance that had been inflated by
softheaded newspaper writers. But as they dug deeper, they found
the opposite was true. The truce was far bigger than had been
reported, involving tens of thousands of men along two-thirds of the
British-held line. The interactions included eating, drinking, cooking,
singing, playing soccer matches, exchanging photos, bartering, and
burying the dead.*1 In the annals of history, there are few cases
where all-out violence pivoted so swiftly and completely to familial
warmth. The deeper question is how it happened.
The traditional way of explaining the Christmas Truce is to see it
as a story about how the shared meaning of the holiday can awaken
the better angels of our nature. This way of thinking is attractive, but
it fails to explain what actually occurred. There were plenty of other
battlefields throughout history where enemies experienced shared
spiritual holidays, yet did not engage in anything remotely
approaching this level of connection.
The picture shifts, however, if we look at it through the lens of
belonging cues. One of the most detailed accounts can be found in
Trench Warfare 1914–1918 by Tony Ashworth. Over the course of
288 pages, Ashworth provides the historical equivalent of a slowmotion replay of the forces that triggered the Christmas Truce. He
shows that it began not on Christmas but weeks before, when a
steady flow of interactions created bonds of safety, identity, and

trust. Ashworth likens the arrival of the Christmas Truce to “the
sudden surfacing of the whole of an iceberg, visible to all including
non-combatants, which for most of the war remained largely
submerged.”
Ashworth details the physical closeness of the two sides. While the
closeness brought violence, it also brought connection, through the
smells of cooking and the sounds of voices, laughter, and songs.
Soldiers on both sides became aware that they followed the same
daily rhythms and routines of meals, resupply, and troop rotations.
Both sides dealt with the combination of numbing routine and raw
terror that made up military life. Both sides hated the cold and wet;
both sides longed for home. As Ashworth puts it, “The process of
mutual empathy among antagonists was facilitated by their
proximity in trench war, and, further, was reinforced as the
assumptions made by each of the other’s likely actions were
confirmed by subsequent events. Moreover, by getting to know the
‘neighbor’ in the trench opposite, each adversary realized that the
other endured the same stress, reacted in the same way, and thus
was not so very different from himself.”
Microtruces began in early November. The British and Germans
had a habit of delivering rations to the trenches around the same
time. While the troops ate, the shooting would stop. The next day the
same thing happened at precisely the same time. And the next day.
And the next. From meals, the microtruces spread to other
behaviors. When heavy rainfall made movement difficult, both sides
would stop fighting. On cold nights in some sectors, troops from both
sides would venture forth to gather dry straw for bedding, and both
would withhold fire so they could work in peace. The tacit cease-fires
grew to include supply lines (off limits), latrines (same), and the
gathering of casualties after a battle.
Those interactions sound casual, but in fact each involves an
emotional exchange of unmistakable clarity. One side stops shooting,
leaving itself exposed. The other side senses that exposure but does
nothing. Each time it happens, both experience the relief and
gratitude of safe connection—they saw me.

The connections grew. In several sectors, certain areas were
designated as “out of bounds” for sniper fire and designated with
white flags. One English artillery unit spoke of its “pet sniper” on the
German side who would send his “good night kiss” every night
promptly at nine-fifteen P.M., then shoot no more until the following
morning. In another sector, an English machine-gunner would shoot
out the rhythm of a popular song called “Policeman’s Holiday,” and
his German counterpart would provide an answering refrain. The
trenches became a petri dish of belonging cues. Each cue, by itself,
would not have had much of an impact. But together, repeated day
after day, they combined to create conditions that set the stage for a
deeper connection.
In the soldiers’ accounts, it’s possible to see these connections
strengthen. One morning after a violent battle at the end of
November, Edward Hulse, a captain in the Second Scots Guard,
wrote about an impromptu moment of empathy.
The morning after the attack, there was an almost tacit
understanding as to no firing, and about 6:15 A.M. I saw
eight or nine German shoulders and heads appear, and
then three crawled out a few feet in front of their parapet
and began dragging in some of our fellows who were
either dead or unconscious….I passed down the order that
none of my men were to fire and this seems to have been
done all down the line. I helped one of the men in myself,
and was not fired on, at all.
That incident seems to have affected Hulse. Several weeks later,
from a post behind the lines, he hatched a plan. He wrote:
We return to the trenches tomorrow, and shall be in them on Christmas Day. Germans or no Germans…we are going to have a ’ell of a bust, including plum puddings for the whole battalion. I have got a select little party together, who, led by my stentorian voice, are going to take up a position in our trenches where we are closest to the enemy, about 80 yards, and from 10 P.M. onwards we are
going to give the enemy every conceivable form of song in harmony, from carols to Tipperary….My fellows are most amused with the idea, and will make a rare noise when we get at it. Our object will be to drown the now far too familiar strains of “Deutschland über Alles” and the
“Wacht am Rhein” we hear from their trenches every evening.
The Germans responded with their own barrage of songs. Some were similar, and the Latin songs were identical. From a psychological perspective, they conveyed a meaning that both sides understood, a shared burst of belief and identity.
Hulse walked out and met his counterpart, a German major. The
Germans helped the English bury their dead, and the German
commander handed Hulse a medal and some letters belonging to an
English captain who had died and fallen into the German trench a
week earlier. Overcome with emotion, Hulse took off his silk scarf
and handed it to the German. “It was absolutely astounding,” he later
wrote, “and if I had seen it on a cinematograph film I should have
sworn that it was faked!”
A few miles away, near Ploegsteert Wood, Corporal John Ferguson
crouched in his trench, trying to figure out what was happening. He
later wrote:
We shouted back and forward until Old Fritz [the German
officer] clambered out of the trench, and accompanied by
three others of my section, we went out to meet
him….“Make for the light,” he called and as we came
nearer we saw he had his flash lamp in his hand, putting
it in and out to guide us.
We shook hands, wishing each other a Merry Xmas,
and were soon conversing as if we had known each other
for years. We were in front of their wire entanglements

and surrounded by Germans—Fritz and I in the centre
talking, and Fritz occasionally translating to his friends
what I was saying. We stood inside the circle like streetcorner orators….Where they couldn’t talk the language
they were making themselves understood by signs, and
everyone seemed to be getting along nicely. Here we were
laughing and chatting to men whom only a few hours
before we were trying to kill!
Hulse and Ferguson, like so many others, were astounded. But it
was not really astounding. At the point when the English and the
Germans stepped out onto that field, they had already been in
conversation for a long time, both sides sending volleys of belonging
cues that lit up their amygdalas with a simple message: We are the
same. We are safe. I’ll go halfway if you will. And so they did.*2

The One-Hour Experiment
If you had to pick an environment that is the opposite of the Flanders
trenches, you might pick the WIPRO call center in Bangalore, India.
WIPRO is the model of a successful call center. It is organized. It is
highly efficient. The days consist of the same work that happens in
call centers all over the world: A caller phones in with issues about a
device or a service, and WIPRO’s agents attempt to remedy it.
WIPRO (pronounced WHIP-row) is by almost every measure a nice
place to work. It features competitive salaries and high-quality
facilities. The company treats employees well, providing good food,
transportation, and social activities. But in the late 2000s, WIPRO
found itself facing a persistent problem: Its employees were leaving
in droves, as many as 50 to 70 percent each year. They left for the
usual reasons—they were young or taking a different job—and for
reasons they couldn’t quite articulate. At bottom, they lacked a
strong connection to the group.

WIPRO’s leaders initially tried to fix things by increasing
incentives. They boosted salaries, added perks, and touted their
company’s award as one of India’s best employers. All these moves
made sense—but none of them helped. Employees kept leaving at
precisely the same rate as before. And so in the fall of 2010, with the
help of researchers Bradley Staats, Francesco Gino, and Daniel
Cable, they decided to embark on a small experiment.
The experiment went like this: Several hundred new hires were
divided into two groups, plus the usual control group. Group one
received standard training plus an additional hour that focused on
WIPRO’s identity. These trainees heard about the company’s
successes, met a “star performer,” and answered questions about
their first impressions of WIPRO. At the end of the hour, they
received a fleece sweatshirt embroidered with the company’s name.
Group two also received the standard training, plus an additional
hour focused not on the company but on the employee. These
trainees were asked questions like What is unique about you that
leads to your happiest times and best performances at work? In a
brief exercise, they were asked to imagine they were lost at sea and to
consider what special skills they might bring to the situation. At the
end of the hour, they were given a fleece sweatshirt embroidered
with their name alongside the company’s name.
Staats didn’t expect the experiment to show much. High attrition is
the norm in the call center world, and WIPRO’s attrition rates were
firmly in line with industry averages. And besides, Staats wasn’t
inclined to believe a one-hour intervention could make a long-term
impact. A former engineer who spent the first years of his career as
an analyst at Goldman Sachs, he isn’t some pie-in-the-sky academic.
He knows how things work in the real world.
“I was pretty sure that our experiment was going to show a small
effect, if any at all,” Staats says. “I saw the onboarding process in
rational, transactional, informational terms. You show up at a new
job on the first day, and there’s a straightforward process where you
learn how to act, how to behave, and that’s all there is to it.”

Seven months later the numbers came in, and Staats was, as he
puts it, “completely shocked.” Trainees from group two were 250
percent more likely than those from group one and 157 percent more
likely than those from the control group to still be working at
WIPRO. The hour of training had transformed group two’s
relationship with the company. They went from being noncommittal
to being engaged on a far deeper level. The question was why.
The answer is belonging cues. The trainees in group one received
zero signals that reduced the interpersonal distance between
themselves and WIPRO. They received lots of information about
WIPRO and star performers, plus a nice company sweatshirt, but
nothing that altered that fundamental distance.
The group two trainees, on the other hand, received a steady
stream of individualized, future-oriented, amygdala-activating
belonging cues. All these signals were small—a personal question
about their best times at work, an exercise that revealed their
individual skills, a sweatshirt embroidered with their name. These
signals didn’t take much time to deliver, but they made a huge
difference because they created a foundation of psychological safety
that built connection and identity.
“My old way of thinking about this issue was wrong,” Staats says. “It turns out that there are a whole bunch of effects that take place when we are pleased to be a part of a group, when we are part of creating an authentic structure for us to be more ourselves. All sorts of beneficial things play out from those first interactions.” I talked with Dilip Kumar, one of the original WIPRO trainees who had taken part in the experiment. I expected him to share vivid memories of the session, but talking to him about his orientation was a lot like talking to Jeff Dean about fixing the AdWords engine: His sense of belonging was so strong that he’d basically forgotten that the experiment had ever happened. “To be honest, I don’t remember much about that day, but I remember it felt motivating,” said Kumar. He laughed. “I guess it must have worked, because I am still here, and I definitely like it.”

The Opposite of Belonging
While it’s useful to spend time with successful cultures, it’s equally useful to travel to the other end of the spectrum, to examine cultures that fail. The most instructive may be those where the group fails with such consistency that it approaches a kind of perfection. This is where we find the story of the Minuteman missileers. The Minuteman missileers are the 750 or so men and women who work as nuclear missile launch officers. They are stationed at remote air force bases in Wyoming, Montana, and North Dakota, and their job, for which they are extensively trained, is to control some of the most powerful weapons on earth, 450 Minuteman III missiles. The missiles are sixty feet tall, weigh 80,000 pounds, and can travel 15,000 miles per hour to any spot on the globe within thirty minutes, each delivering twenty times more explosive energy than the Hiroshima bomb.

''';

final String sprintPreview ='''Introduction
One overcast morning in May 2014, John Zeratsky walked into a drab beige building in Sunnyvale, California. John was there to talk with Savioke Labs, one of Google Ventures’ newest investments. He wound his way through a labyrinth of corridors and up a short flight of stairs, found the plain wooden door marked 2B, and went inside.
Now, tech companies tend to be a little disappointing to those expecting glowing red computer eyes, Star Trek–style holodecks, or top secret blueprints. Most of Silicon Valley is essentially a bunch of desks, computers, and coffee cups. But behind door 2B there were piles of circuit boards, plywood cutouts, and plastic armatures fresh off the 3D printer. Soldering irons, drills, and blueprints. Yes, actual top secret blueprints. “This place,” thought John, “looks like a startup should look.”
Then he saw the machine. It was a three-and-a-half-foot-tall cylinder, roughly the size and shape of a kitchen trash can. Its glossy white body had a flared base and an elegant taper. There was a small computer display affixed to the top, almost like a face. And the machine could move. It glided across the floor under its own power.
“This is the Relay robot,” said Steve Cousins, Savioke’s founder and CEO. Steve wore jeans and a dark T-shirt, and had the enthusiastic air of a middle-school science teacher. He watched the little machine with pride. “Built right here, from off-the-shelf parts.”
The Relay robot, Steve explained, had been engineered for hotel delivery service. It could navigate autonomously, ride the elevator by itself, and carry items such as toothbrushes, towels, and snacks to guest rooms. As they watched, the little robot carefully drove around a desk chair, then stopped near an electrical outlet.
Savioke (pronounced “Savvy Oak”) had a team of world-class engineers and designers, most of them former employees of Willow Garage, a renowned private robotics research lab in Silicon Valley. They shared a vision for bringing robot helpers into humans’ everyday lives—in restaurants, hospitals, elder care facilities, and so on.
Steve had decided to start with hotels because they were a relatively simple and unchanging environment with a persistent problem: “rush hour” peaks in the morning and evening when check-ins, check-outs, and room delivery requests flooded the front desk. It was the perfect opportunity for a robot to help. The next month, this robot—the first fully operational Relay—would go into service at a nearby hotel, making real deliveries to real guests. If a guest forgot a toothbrush or a razor, the robot would be there to help.
But there was one problem. Steve and his team worried that guests might not like a delivery robot. Would it unnerve or even frighten them? The robot was a technological wonder, but Savioke wasn’t sure how the machine should behave around people.
There was too much of a risk, Steve explained, that it could feel creepy to have a machine delivering towels. Savioke’s head designer, Adrian Canoso, had a range of ideas for making the Relay appear friendly, but the team had to make a lot of decisions before the robot would be ready for the public. How should the robot communicate with guests? How much personality was too much? “And then there’s the elevator,” Steve said.
John nodded. “Personally, I find elevators awkward with other humans.”
“Exactly.” Steve gave the Relay a pat. “What happens when you throw a robot in the mix?”
Savioke had only been in business for a few months. They’d focused on getting the design and engineering right. They’d negotiated the pilot with Starwood, a hotel chain with hundreds of properties. But they still had big questions to answer. Mission-critical, make-or-break type questions, and only a few weeks to figure out the answers before the hotel pilot began.
It was the perfect time for a sprint.''';

final String sprint ='''Introduction
One overcast morning in May 2014, John Zeratsky walked into a drab beige building in Sunnyvale, California. John was there to talk with Savioke Labs, one of Google Ventures’ newest investments. He wound his way through a labyrinth of corridors and up a short flight of stairs, found the plain wooden door marked 2B, and went inside.
Now, tech companies tend to be a little disappointing to those expecting glowing red computer eyes, Star Trek–style holodecks, or top secret blueprints. Most of Silicon Valley is essentially a bunch of desks, computers, and coffee cups. But behind door 2B there were piles of circuit boards, plywood cutouts, and plastic armatures fresh off the 3D printer. Soldering irons, drills, and blueprints. Yes, actual top secret blueprints. “This place,” thought John, “looks like a startup should look.”
Then he saw the machine. It was a three-and-a-half-foot-tall cylinder, roughly the size and shape of a kitchen trash can. Its glossy white body had a flared base and an elegant taper. There was a small computer display affixed to the top, almost like a face. And the machine could move. It glided across the floor under its own power.
“This is the Relay robot,” said Steve Cousins, Savioke’s founder and CEO. Steve wore jeans and a dark T-shirt, and had the enthusiastic air of a middle-school science teacher. He watched the little machine with pride. “Built right here, from off-the-shelf parts.”
The Relay robot, Steve explained, had been engineered for hotel delivery service. It could navigate autonomously, ride the elevator by itself, and carry items such as toothbrushes, towels, and snacks to guest rooms. As they watched, the little robot carefully drove around a desk chair, then stopped near an electrical outlet.
Savioke (pronounced “Savvy Oak”) had a team of world-class engineers and designers, most of them former employees of Willow Garage, a renowned private robotics research lab in Silicon Valley. They shared a vision for bringing robot helpers into humans’ everyday lives—in restaurants, hospitals, elder care facilities, and so on.
Steve had decided to start with hotels because they were a relatively simple and unchanging environment with a persistent problem: “rush hour” peaks in the morning and evening when check-ins, check-outs, and room delivery requests flooded the front desk. It was the perfect opportunity for a robot to help. The next month, this robot—the first fully operational Relay—would go into service at a nearby hotel, making real deliveries to real guests. If a guest forgot a toothbrush or a razor, the robot would be there to help.
But there was one problem. Steve and his team worried that guests might not like a delivery robot. Would it unnerve or even frighten them? The robot was a technological wonder, but Savioke wasn’t sure how the machine should behave around people.
There was too much of a risk, Steve explained, that it could feel creepy to have a machine delivering towels. Savioke’s head designer, Adrian Canoso, had a range of ideas for making the Relay appear friendly, but the team had to make a lot of decisions before the robot would be ready for the public. How should the robot communicate with guests? How much personality was too much? “And then there’s the elevator,” Steve said.
John nodded. “Personally, I find elevators awkward with other humans.”
“Exactly.” Steve gave the Relay a pat. “What happens when you throw a robot in the mix?”
Savioke had only been in business for a few months. They’d focused on getting the design and engineering right. They’d negotiated the pilot with Starwood, a hotel chain with hundreds of properties. But they still had big questions to answer. Mission-critical, make-or-break type questions, and only a few weeks to figure out the answers before the hotel pilot began.
It was the perfect time for a sprint.
The sprint is GV’s unique five-day process for answering crucial questions through prototyping and testing ideas with customers. It’s a “greatest hits” of business strategy, innovation, behavioral science, design, and more—packaged into a step-by-step process that any team can use.
The Savioke team considered dozens of ideas for their robot, then used structured decision-making to select the strongest solutions without groupthink. They built a realistic prototype in just one day. And for the final step of the sprint, they recruited target customers and set up a makeshift research lab at a nearby hotel.
We’d love to tell you that we, the authors, were the genius heroes of this story. It’d be wonderful if we could swoop into any company and dish out brilliant ideas that would transform it into a breakout success. Unfortunately, we are not geniuses. Savioke’s sprint worked because of the real experts: the people who were on the team all along. We just gave them a process to get it done.
Here’s how the Savioke sprint went down. And if you’re not a roboticist yourself, don’t worry. We use this same exact sprint structure for software, services, marketing, and other fields.
First, the team cleared a full week on their calendars. From Monday to Friday, they canceled all meetings, set the “out of office” responders on their email, and completely focused on one question: How should their robot behave around humans?
Next, they manufactured a deadline. Savioke made arrangements with the hotel to run a live test on the Friday of their sprint week. Now the pressure was on. There were only four days to design and prototype a working solution.
On Monday, Savioke reviewed everything they knew about the problem. Steve talked about the importance of guest satisfaction, which hotels measure and track religiously. If the Relay robot boosted satisfaction numbers during the pilot program, hotels would order more robots. But if that number stayed flat, or fell, and the orders didn’t come in, their fledgling business would be in a precarious position.
Together, we created a map to identify the biggest risks. Think of this map as a story: guest meets robot, robot gives guest toothbrush, guest falls for robot. Along the way were critical moments when robot and guest might interact for the first time: in the lobby, in the elevator, in the hallway, and so on. So where should we spend our effort? With only five days in the sprint, you have to focus on a specific target. Steve chose the moment of delivery. Get it right, and the guest is delighted. Get it wrong, and the front desk might spend all day answering questions from confused travelers.
One big concern came up again and again: The team worried about making the robot appear too smart. “We’re all spoiled by C-3PO and WALL-E,” explained Steve. “We expect robots to have feelings and plans, hopes and dreams. Our robot is just not that sophisticated. If guests talk to it, it’s not going to talk back. And if we disappoint people, we’re sunk.”
On Tuesday, the team switched from problem to solutions. Instead of a raucous brainstorm, people sketched solutions on their own. And it wasn’t just the designers. Tessa Lau, the chief robot engineer, sketched. So did Izumi Yaskawa, the head of business development, and Steve, the CEO.
By Wednesday morning, sketches and notes plastered the walls of the conference room. Some of the ideas were new, but some were old ideas that had once been discarded or never thought through. In all, we had twenty-three competing solutions.
How could we narrow them down? In most organizations, it would take weeks of meetings and endless emails to decide. But we had a single day. Friday’s test was looming, and everybody could sense it. We used voting and structured discussion to decide quickly, quietly, and without argument.
The test would include a slate of Savioke designer Adrian Canoso’s boldest ideas: a face for the robot and a soundtrack of beeps and chimes. It would also include one of the more intriguing but controversial ideas from the sketches: When the robot was happy, it would do a dance. “I’m still nervous about giving it too much personality,” Steve said. “But this is the time to take risks.”
“After all,” said Tessa, “if it blows up now, we can always dial back.” Then she saw the looks on our faces. “Figure of speech. Don’t worry, the robot can’t actually blow up.”
As Thursday dawned, we had just eight hours to get the prototype ready for Friday’s live test in the hotel. That shouldn’t have been enough time. We used two tricks to finish our prototype on time:
1. Much of the hard work had been done already. On Wednesday, we had agreed on which ideas to test, and documented each potential solution in detail. Only the execution remained.
2. The robot didn’t need to run autonomously, as it would eventually in the hotel. It just needed to appear to work in one narrow task: delivering one toothbrush to one room.
Tessa and fellow engineer Allison Tse programmed and tuned the robot’s movements using a beat-up laptop and a PlayStation controller. Adrian put on a pair of massive headphones and orchestrated the sound effects. The “face” was mocked up on an iPad and mounted to the robot. By 5 p.m., the robot was ready.
For Friday’s test, Savioke had lined up interviews with guests at the local Starwood hotel in Cupertino, California. At 7 a.m. that morning, we rigged a makeshift research lab inside one of the hotel’s rooms by duct-taping a couple of webcams to the wall. And at 9:14 a.m., the first guest was beginning her interview.
• • •
The young woman studied the hotel room decor: light wood, neutral tones, a newish television. Nice and modern, but nothing unusual. So what was this interview all about?
Standing beside her was Michael Margolis, a research partner at GV. For now, Michael wanted to keep the subject of the test a surprise. He had planned out the entire interview to answer certain questions for the Savioke team. Right now, he was trying to understand the woman’s travel habits, while encouraging her to react honestly when the robot appeared.
Michael adjusted his glasses and asked a series of questions about her hotel routine. Where does she place her suitcase? When does she open it? And what would she do if she’d forgotten her toothbrush?
“I don’t know. Call the front desk, I suppose?”
Michael jotted notes on a clipboard. “Okay.” He pointed to the desk phone. “Go ahead and call.” She dialed. “No problem,” the receptionist said. “I’ll send up a toothbrush right away.”
As soon as the woman returned the receiver to its cradle, Michael continued his questions. Did she always use the same suitcase? When was the last time she’d forgotten something on a trip?
Brrrring. The desk phone interrupted her. She picked up, and an automated message played: “Your toothbrush has arrived.”
Without thinking, the woman crossed the room, turned the handle, and opened the door. Back at headquarters, the sprint team members were gathered around a set of video displays, watching her reaction.
“Oh my god,” she said. “It’s a robot!”
The glossy hatch opened slowly. Inside was the toothbrush. The robot made a series of chimes and beeps as the woman confirmed delivery on its touch screen. When she gave the experience a five-star review, the little machine danced for joy by twisting back and forth.
“This is so cool,” she said. “If they start using this robot, I’ll stay here every time.” But it wasn’t what she said. It was the smile of delight that we saw over the video stream. And it was what she didn’t do—no awkward pauses and no frustration as she dealt with the robot.
Watching the live video, we were nervous throughout that first interview. By the second and third, we were laughing and even cheering. Guest after guest responded the same way. They were enthusiastic when they first saw the robot. They had no trouble receiving their toothbrushes, confirming delivery on the touch screen, and sending the robot on its way. People wanted to call the robot back to make a second delivery, just so they could see it again. They even took selfies with the robot. But no one, not one person, tried to engage the robot in any conversation.
At the end of the day, green check marks filled our whiteboard. The risky robot personality—those blinking eyes, sound effects, and, yeah, even the “happy dance”—was a complete success. Prior to the sprint, Savioke had been nervous about overpromising the robot’s capability. Now they realized that giving the robot a winsome character might be the secret to boosting guest satisfaction.
Not every detail was perfect, of course. The touch screen was sluggish. The timing was off on some of the sound effects. One idea, to include games on the robot’s touch screen, didn’t appeal to guests at all. These flaws meant reprioritizing some engineering work, but there was still time.

''';