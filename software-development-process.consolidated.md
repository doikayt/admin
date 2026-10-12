## Software Development Process

### Our engineering values in a nutshell

- **Automation.**
    - If we do something twice, we ask ourselves: any reason not to script it and  make it easier in the future?.
- **Craftsmanship.**
    - Taking our time to produce maintainable and clean designs, and intuitive _well documented_ interfaces and APIs
- **Documentation**
    -  From day one: a new developer's first objective is a confidence building, easy win: a PR 
       improving our on-boarding docs. New members see the rough edges first, so they're 
      best posititioned to smooth them.
- **Staff Skills Development.** 
    -  Many of the processes discussed below support this:  welcoming interrupts for assistance, enabling rapid set-up
       of  development environments, and consistent and disciplined documentation makes the journey 
       to  'first significant PR' much faster for those who've newly joined.


### Where AI fits in

We make extensive use of AI to deliver intuitive, useful solutions built off of a robust,
well-documented code base.  Three habits help us keep the quality high and 
the AI slop factor near zero: we always begin
projects with the end user in mind, we understand the solution proposed by the AI before we use it, and we
teach that understanding forward by writing 'backgrounders'  (short primers on the 
key technology and/or platform concepts new engineers will need to 
understand before building on top of our code.) The details are in
[How We Work With AI](https://www.doikayt.org/practice.html).


### How we differ from a typical VC-backed start-up

In general, our processes follow from our primary end goal: jump-starting a long-lasting movement of activist
technologists -- professionals who join us not only with the reasonable expectation of 
financial reward for their efforts (see [here](https://github.com/doikayt/admin/blob/master/governance/commons-hub-pattern.md#4-distribution-of-economic-benefits--from-founder-incentives-to-broad-based-ownership) for more detail on how we plan to facilitate that.) -- 
but who are equally motivated by the desire 
to change the world for the better -- helping bend the long arc of the moral universe
toward justice a little faster ([paraphrasing a little](https://quoteinvestigator.com/2012/11/15/arc-of-universe/)).
That goal means we prioritize and organize work very differently from a VC-funded
start-up. It's worth spelling out the differences, both for the benefit of the potential 
contributors who will likely be coming from such traditional backgrounds, and because of the insight 
that this contrast provides into  the how's and why's behind the design of our processess.

A venture-funded company answers to stakeholders who want returns in a few quarters and
that pressure shapes everything. Such companies will often pay sky-high salaries to recruit star engineers, 
and often come to depend on top-down processes to ensure that milestones are hit. In our
opinion this short term orientation tempts teams into falling into the 
[indispensible leader trap](https://www.amazon.in/Indispensable-Trap-Building-beyond-presence-ebook/dp/B0GYNMWFTG), and 
and taking shortcuts which can result in mounds of technical
debt, as well as brittle code bases that are a horror to work with.
We have a different horizon. We don't have VCs breathing down our necks, 
so instead of chasing a quarterly number we 
can focus on building _a template for a movement_, not something that gets flipped for a quick return at IPO or acquisition.

### Our goals and the processes that support them

Our longer horizon mission feeds directly into four goals. Each one shapes a part of how we work.

| Goal                                             | Supporting process                    |
|--------------------------------------------------|---------------------------------------|
| Push leadership responsibility to junior members | Allow all team members a voice in major decisions              |
| Build a core team and wider community from a broad base of talent at varying skill levels | Robust, documented, automated process |
| Build engineering talent over the long term      | Backgrounders ("teach it forward")    |
| Attract new customers and contributors           | Publish content that establish individuals in our organization as thought leaders    |


#### Pushing leadership to junior members

Over the long term we intend to build tooling that uses token-based delegated authority to make major decisions,
as described in
[here](https://github.com/doikayt/admin/blob/master/governance/commons-hub-pattern.md#token-based-delegated-authority).
For now,  we move in that direction informally, by giving every team member a voice.


#### Leveraging a broad base of talent at varying skill levels 

We expect a flood of volunteers at every skill level. (See 
[here](https://github.com/doikayt/admin/blob/master/governance/commons-hub-pattern.md#the-labor-market-half-of-the-advantage-elite-overproduction-and-ai-driven-displacement) for reasons why.) 
We treat this as an opportunity: identifying and mentoring people with 
talent and potential is part of how we build the collective. 

What makes this workable: 
    
- extremely robust, well-documented, automated process. 
  - When the process carries the knowledge, newcomers with questions don't have to wait on the availability of a colleague.
- an open door culture emphasizing _Don't Get Stuck!_ 
  - When one of our team members has a question, we prioritize taking the interrupt, unblocking people is high leverage -- 
    it takes little of our time and can save blocked colleagues tons of it.

#### Building engineering talent over the long term

As we design and implement, we drop markers, also known as backgrounders. A backgrounder
explains not only what we built, it also contains "just in time" tutorials on the key
technologies used in a given solution. Writing one pushes developers to understand the
underlying tech they're using instead of just accepting a first-pass AI answer.
This is the "teach it forward" habit described in
[How We Work With AI](https://www.doikayt.org/practice.html#teach-it-forward).


#### Attracting new customers and contributors

We communicate our work through published articles that push credit to
junior members. This helps them build their portfolios, and at the same time,
promotes our organization as a thought leader in areas covered.   The backgrounders discussed 
above support this objective since they are good raw material for published content.

### Why we think this pattern positions us for success

In nature we see very complex, functional and resilient structures building themselves --
with no coordinating entity visibly 'in charge'. Our aspirational goal as a 
collective is to function kind of like a coral reef with a feedback 
loop that improves its growth algorithm.
Coral reefs self-organize  for growth based on principles of **cellular automata**: basically 
algorithms wherein  input consists of a  grid of cells and their current states, plus
various external environmental factors (e.g., gradients of salinity, temperature etc.) Individual 
clusters of cells then make decisions on where to put resources for  branching, clustering, self-repair.

#### Lessons from the coral reef model of autonomously directed growth

Our collective aspires to the same type of resilient structure. For us the key lesson
from the 'Coral Reef Book of Growth' is the ability to act as autonomously as possible: 
we want our individual contributors and individual developer 'pods' to have the same directional freedom
as a reef polyp. However, their inputs are more wide-ranging, consisting of: 
- clearly stated requirements for the given project
- our development process itself:
    - highly automated workflows from on-boarding to day-to-day ops
    - high quality 'just in time' documentation (including Backgrounders, screencasts, etc.)
    - an interrupt encouraging culture that emphasizes 'Don't Get Stuck!'

The desired output is:  high quality software built to spec _and_ an improved development process.
All this  framing should help explain why our processes  will evolve in very different directions than
those of short-term horizon VC-backed companies.  Most obviously, our longer term
horizon means any investment in process pays back  over a much wider ranging operational period, making
such investment much more attractive. As this section points out, high quality documentation and automation 
are must-haves for self-directed autonomous teams to function. Since our automated processes are open source, 
our pride-of-craftsmanship works to  help ensure 
that any published automated workflows that underly these processeses are polished and resilient. 
Also, by making these processes open we enable contributions (fixes, bug reports,etc.) from a broader community.


#### Leveraging the wisdom of the crowd

We are confident that 
[we can attract a very broad pool of talent](https://github.com/doikayt/admin/blob/master/governance/commons-hub-pattern.md#the-labor-market-half-of-the-advantage-elite-overproduction-and-ai-driven-displacement), 
and -- as the size of our contributor roster grows -- that we will be able to 
task more than one developer 'pod' with pursuing independent solutions to a given problem, 
at which point the 
[*The Wisdom of Crowds*](https://en.wikipedia.org/wiki/The_Wisdom_of_Crowds) has the potential to kick in.
James Surowiecki's book of the same name notes a number of  necessary conditions  that must 
be met for this to work well, chief among which is the availability of a  fair and 
efficient methodology  for the **aggregation** of solutions: the crowd needs 
a way to turn many judgments into one decision. For
us this boils down requiring that the following be agreed to by all involved staff, then 
written down _and_ version controlled:

- **Clear, measurable success criteria,** agreed metrics via which each teams solution will 
  be judged.
- **A firm calendar date for the decision.** On the agreed date all teams involved pick a direction. 
   The value of the work of the team that generated the rejected alternative  is recognized. Then 
   [all wood is placed behind the arrow](https://www.quora.com/What-is-the-origin-of-the-phrase-putting-wood-behind-the-arrow) 
  of the chosen solution.
  

## Mechanics 