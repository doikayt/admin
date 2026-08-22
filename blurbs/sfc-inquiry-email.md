Step-1 fiscal sponsorship inquiry email to Software Freedom Conservancy, per their process
(sfconservancy.org/members/apply/ — a brief inquiry to apply@sfconservancy.org, project
description + website URL, followed by preliminary questions and then detailed application
materials on governance/leadership/community).

To: apply@sfconservancy.org
Subject: Fiscal sponsorship inquiry — Doikayt (FOSS build/release tooling + GAS app-dev stack)

---

Hello, Conservancy team,

My name is Chris Bedford and I'm the founder of an early stage software collective, Doikayt
Mobilization Labs (@ https://doikayt.org).
We are very interested in exploring whether our company would be a good candidate for fiscal
sponsorship by the Software Freedom Conservancy.

Our core missions seem extremely well aligned: we formed our company to develop open source
digital tools for other non-profits and community organizations that, like us, are dedicated
to the fight for human, worker, labor and civil rights.
We actively research alternatives to Big Tech controlled commercial software and have
established a Wiki that we hope will serve as an open field guide to such alternatives
(@ https://wiki.doikayt.org).

Many of the organizations we work with use Google Sheets as a free, lightweight CRM (customer
relationship management) tool as the backbone of their mobilization and outreach efforts.
We are developing a free, MIT-licensed framework for the creation of such CRM extensions.

The foundation layers of our stack are completely Google-free.

- https://github.com/doikayt/typescript-build-config

  bootstraps new projects with a pre-configured set of tools (linters, bundlers, Playwright,
  vitest, standard utility scripts) and enforces a standardized build, versioning and release
  policy.

- https://github.com/doikayt/build-tools

  provides a mechanism for autogeneration of documentation from code and CI-time verification
  that docs and code are in sync.

Our demodulify library (https://github.com/doikayt/gas-demodulify-plugin) adapts applications
with traditional modular structure to Google's "flat" namespace runtime environment. By nature,
this component is specifically Google-targeted.

This is a real point of contradiction for many of our customers who have ethical concerns about
using Google software and services. For this reason, our fiscal sponsorship application will
provide not only a project plan and budget for the final build-out of our stack for Google
Sheets extensions, but will also allocate time/budget for a spike intended to determine the
viability of releasing this kind of lightweight, spreadsheet-based CRM software on open
platforms. (An example: nominatim.openstreetmap.org instead of depending on Google's Maps API.)

After reading through your site, we hit on another aspect of development you also might be
interested in funding: the aforementioned foundation layers of our stack are Google-free, but
they are bound up with the release-workflow APIs of GitHub. We detest Microsoft and would
ABSOLUTELY want to work with you on budgeting time (and it would not be much!) to figure out
how to move our entire stack — and any future stacks that _build_ on our stack — to more
open-source-friendly platforms such as Codeberg, which we understand is your own recommended
home under the Give Up GitHub campaign. As you can see, this would have a multiplier effect:
any new products built on our stack could easily be off-migrated from GitHub with no loss of
post-commit trigger functionality.

Long note... my apologies, but it does seem like there is really good alignment here. I'd look
forward to speaking directly with your staff.

Best regards,

- Chris
