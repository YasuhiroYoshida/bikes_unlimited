# bikes_unlimited

Earlier, I was open to a new opportunity. A company called Apply4 asked me to do this task to see my skills and experiences. This is the work I delivered.
<br>

Here's an excerpt from the correspondence with them that took place.

    Hi Yasuhiro,

    Thanks for getting back to me. I'm happy you're keen to go forward to the next step.


    The next stage is to work on a sample project followed by a programming session with some of the team. We will use this opportunity to see how you work. Please do something you are proud of and can explain in detail.


    Below is a short system description of a project you’ll be working on. Although the whole system could require a lot of your time, we aren’t asking you to create the whole system, just some small parts of the back end. Do just enough to fulfil the user stories, nothing more. In fact, it is even ok if you don’t finish the tasks. Our aim is to get an idea of how you work and how you write code. We will not be judging you on whether or not you finish the project.


    Please approach the project in the following order:


    Estimate the time required to complete it and inform us by replying to this email

    Create a public repo for the project on Github or similar and share it with us. We are very interested in seeing your code’s progression along the way, so please make git commits as you go and don’t just upload your finished code.

    Work on the project. You can take as long as you feel you need however we urge you not to spend more than a few hours - you do not need to finish the task but you do need to do enough for us to be able to see how you work. Remember: we are evaluating how well you would fit on a team of developers, not working in isolation.

    Once you have finished your work please tag your development branch as 1.0 and send us an email to let us know it is complete.


    We will review the solution and assess the code quality, structure and use of best practices. Please do not copy code from the internet as we need to be able to evaluate your own code.


    Please use this as an opportunity to show us how good you are at coding and not how quick, we are interested in quality, not quantity, in the context of a team of developers.


    Once you’ve finished we will organise a programming session where you can explain your code and add some features.


    If you have any questions during the project, please ask via email.


    Thanks!

    Matt

    ----


    System Description

    Bikes Unlimited is a small organization that certifies cyclists for riding on the road. They are internationally recognized with clients throughout the world who speak multiple languages. They have certified millions of riders. They run their infrastructure on Azure but use Linux on the back end. The back end consists of an API and an integrated Admin panel. The front end is web-based and interacts with the API.


    BU has a nightly certification workflow that consists of


    Receiving a CSV from a partner certification center

    Converting each row of the CSV into a rider’s license in PDF format

    Emailing the PDF to the license holder using the email field in the CSV

    Finally, when the whole file has been processed, the system notifies by email both the partner certification center and BU that all certifications in the CSV have been processed.


    Given the amount of data processed on a daily basis, it is imperative that processing the CSV be done via a scheduled task and not as part of the upload process.

    Given the relative sensitivity of the data, only authenticated users can upload a file for processing (for this sample project, please only add authentication if you have time, this is low priority for this sample project).


    Using RoR, create an API and necessary code that fulfils the following user stories.


    User Stories

    I, as an authenticated user, can upload a CSV so that BU can process the data and mail the cyclist licenses. (Note: for this story, it is not necessary to create a front end, only an endpoint and associated backend code)

    I, as a certified cyclist, can print a PDF of my license so that I can start riding immediately.

    I, as the owner of BU, can read an email containing a summary of the nightly activity so that I can gauge how well my business is doing.

<br>
I spent about two hours and forty-five minutes on this.

After I submitted, I got a reply from them as follows:

    Dear Yasuhiro,

    Thanks again for doing the technical task. We appreciate the time you've invested in it.
    A couple of us have reviewed it here and noticed lots of good things.
    We are looking for someone very strong technically for this role and there are some aspects where we felt things could be improved further.
    If you had more time, are there any aspects you'd be keen to improve about your solution, particularly to help with maintainability?

    Kind regards,
    Matt

<br>
My reply followed.

    Dear Matt,

    Thank you for taking your time reviewing my work.

    > If you had more time, are there any aspects you'd be keen to improve about your solution, particularly to help with maintainability?

    For controllers: I would create a class and methods for responses so that messages written to log files and received by the requester can be as simple and intelligible as possible conforming to the existing conventions. Also, I would give a namespace. UploadsController would become Api::V1::UploadsController.

    For models: I would add validations.

    For mailers: I would make literal strings a constant of the enclosing class. Or perhaps it may be a good idea to pass possible variables like subject as an argument to the mailers. In any case, if users do speak different languages, I would store them separately under config/locales and access them using the built-in I18n functionality to serve users from different regions.

    For views: I would improve them so that they will only receive finalized numbers and strings; In other words, method calls that require computation like @failed_user_names.join(", ") would be done beforehand in the mailer, and the only job left for the view is just to render it.

    For rake tasks: I would improve them so that formatted messages show up in log files in case of error. Also, though it may add complexity, it might be a good idea to extract much of the implementation and move it to somewhere. For example, you can keep it as a "service" object. It doesn't really belong in controller, model, nor view. But it might not belong under /lib directory, either as "lib" often implies something independent or portable. The logic inside the rake task is again "unfinished business," something very specific to the requirements of the app. When you think about it, it might fit better under /services directory. By having it as a service, you can also have it readily available and manageable all the time like any other object while keeping it dry.

    These are what came to my mind when I looked at my work one more time.

    Thank you.

    Best regards,
    Yasuhiro
