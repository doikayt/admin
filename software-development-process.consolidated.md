## Software Development Process

We make extensive use of AI to deliver intuitive, useful solutions built off of a robust,
well-documented code base.  Three habits help us keep the quality high and 
the AI slop factor near zero: we always begin
projects with the end user in mind, we understand the solution proposed by the AI before we use it, and we
teach that understanding forward by writing 'backgrounders'  (short primers to the 
key technology and/or platform concepts new engineers will need to 
understand before building on top of our code.) The details are in
[How We Work With AI](https://www.doikayt.org/practice.html).

In general, our processes follow from our primary end goal: jump-starting a long-lasting movement of activist
technologists -- professionals who are (of course) motivated by a decent financial reward for their efforts 
(see [here](https://github.com/doikayt/admin/blob/master/governance/commons-hub-pattern.md#4-distribution-of-economic-benefits--from-founder-incentives-to-broad-based-ownership) for more detail on how we plan to facilitate that.)
At the same time, we expect our team members will be equally motivated by the  
desire to change the world for the better, to help bend the long arc of the moral universe
toward justice a little faster ([paraphrasing a little](https://quoteinvestigator.com/2012/11/15/arc-of-universe/)).

That goal means we prioritize and organize work very differently from a VC-funded
start-up. It's worth spelling out the differences, because most of our processes only
make sense against that background.

### How we differ from a typical VC-backed start-up

A venture-funded company answers to stakeholders who want returns in a few quarters.
That pressure shapes everything. Such companies will often pay sky-high salaries to recruit star engineers, 
and often come to depend on top-down processes to ensure that milestones are hit. In our
opinion this short term orientation tempts engineering teams into shortcuts which can result in mounds of technical
debt and brittle code bases that are a horror to work with.
We have a different horizon. We don't have VCs breathing down our necks, 
so instead of chasing a quarterly number we 
can focus on building _a template for a movement_, not something that gets flipped for a quick return at IPO or acquisition.

### Our goals and the processes that support them

That outlook feeds directly into four goals. Each one shapes a part of how we work.

| Goal                                             | Supporting process                    |
|--------------------------------------------------|---------------------------------------|
| Push leadership responsibility to junior members | Allow all team members a voice in major decisions              |
| Build a core team and wider community from a broad base of talent at varying skill levels | Robust, documented, automated process |
| Build engineering talent over the long term      | Backgrounders ("teach it forward")    |
| Attract new customers and contributors           | Publish articles that establish individuals in our organization as thought leaders    |


#### Pushing leadership to junior members

Over the long term we want to use token-based delegated authority to make major decisions,
as described in
[the Commons-Hub document](https://github.com/doikayt/admin/blob/master/governance/commons-hub-pattern.md#token-based-delegated-authority).
For now we move in that direction informally, by giving every team member a voice in major decisions.


#### Leveraging a broad base of talent at varying skill levels 

We expect a flood of volunteers at every skill level. (See 
[here](https://github.com/doikayt/admin/blob/master/governance/commons-hub-pattern.md#the-labor-market-half-of-the-advantage-elite-overproduction-and-ai-driven-displacement) for reasons why.) 
We treat this as an opportunity: mentoring people with talent and potential is part of how
we build the collective, and it pays off for everyone.

What makes this workable: 
    - extremely robust, well-documented, automated process. 
        - When the process carries the knowledge, newcomers with questions don't have to wait on the availability of a colleague.

    - an open door culture emphasizing _Don't Get Stuck!_ 
        - When one of our team members has a question, we prioritize taking the interrupt, unblocking people is high leverage -- 
          it takes little of our time and can save blocked colleagues tons of it.

#### Building engineering talent over the long term

As we design and implement, we drop markers, also known as backgrounders. A backgrounder
explains not just what we built, but also contains "just in time" tutorials on the key
technologies used in a given solution. Writing one pushes developers to understand the
underlying tech instead of accepting a first-pass AI answer, which matters most when the
tech is new to them. This is the "teach it forward" habit described in
[How We Work With AI](https://www.doikayt.org/practice.html#teach-it-forward).


#### Attracting new customers and contributors

We communicate our work through published articles, and those articles push credit to
junior members, which also helps them build their portfolios, and at the same time,
helps establish our organization as a thought leader in areas covered.   
The backgrounders discussed above support this objective since they can be worked into articles pubslished.

### How the work coordinates itself

Think of a path worn across a lawn. Nobody planned it. Each person who cut the corner
made the next person's choice a little easier, until the route was obvious. Biologists
call this kind of effect [stigmergy](https://en.wikipedia.org/wiki/Stigmergy):
coordination through traces left in a shared environment, with nobody directing the whole.
Ant trails are the textbook case, and wikis and commit histories work the same way. Every
edit is a trace that guides the next contributor.

That is why we drop markers as we go. Each backgrounder, design note and well-commented PR
is a trail the next person can follow without asking us first.

### Letting several groups try

Stigmergy gets a crowd working without central direction. We then lean on the
[wisdom of the crowd](https://en.wikipedia.org/wiki/Wisdom_of_the_crowd) to choose between
the results. Sometimes we will deliberately start more than one group on the same task,
with each building its own clean-room implementation. Then we compare them and keep what
works. Two rules keep the comparison fair:

- **Clear, measurable success criteria,** written down before work begins, so we judge all
  the implementations against the same yardstick.
- **A firm calendar date for the decision.** On that date we pick a direction. Without a
  date, comparisons drag on indefinitely.

Duplicated effort looks wasteful. We accept the cost because it replaces a debate we
couldn't settle in advance with evidence.

### Our engineering values

- **Automation.** 
    - If we do something twice, we ask ourselves: any reason not to script it and  make it easier in the future?.
- **Documentation**
    -  One of the first things a new developer does is send a PR improving our on-boarding docs. They see the rough edges first, and
       they're the best person to smooth them. New developers immediately see they are contributing.
- **Staff Skills Development.** We feel invest substantially in mentoring 
    -  Many of the above process approaches support this:  welcoming interrupts to help, enabling rapid set-up
       of  development environments, and consistent and disciplined documentation makes the journey to first 
       useful PR much faster for those who've newly joined.

