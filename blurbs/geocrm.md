# geoCRM (code name)

*A rapid-development framework for [Google Apps Script](https://developers.google.com/apps-script) extensions — launching with a geographic CRM built into [Google Sheets](https://www.google.com/sheets/about/)*

## The Platform & Initial Product

**[Google Apps Script (GAS)](https://developers.google.com/apps-script):** Our applications are designed to be deployed into GAS, [Google Workspace](https://workspace.google.com/)'s extensibility framework. GAS enables developers to inject new functionality directly into Sheets, Docs, and Gmail. Our product will be built on GAS, and deployed into and sold via the GAS ecosystem — the [Google Workspace Marketplace](https://workspace.google.com/marketplace).

**GASify Platform (working code name):** a set of software libraries for quickly and consistently developing and deploying GAS extensions.  

**geoCRM (working code name):** The  first application we plan to build with GASify — a lightweight CRM (customer relationship management) platform that turns an ordinary Google Sheet of contacts into a geographically-aware customer outreach tool by adding two capabilities to the Sheets menu:

- **Sign-up capture** — auto-generates a matching [Google Form](https://www.google.com/forms/about/) and [QR code](https://en.wikipedia.org/wiki/QR_code) directly from the sheet's columns, so new sign-ups flow straight back into the same sheet.
- **Geo-filtering** — filters the contact list to everyone within a chosen radius of a target location — e.g., "who's within 5 miles of Saturday's event."

*Customer list for Company A, provided via Google Sheet — geo-filtering capability added by our platform:*

```
        ┌──────────────────────────────────────────────┐
        │                 Google Sheet                 │
        │          (Company A customer list)           │
        └──────────────────────────────────────────────┘
                               │
                  geoCRM adds  │ + Signup Form & QR Code
                               │ + Geo-Filtering
                               ▼
        ┌──────────────────────────────────────────────┐
        │             geoCRM-enabled Sheet             │
        │                (menu-driven)                 │
        └──────────────────────────────────────────────┘
                               ▲
              Company A staff  │ inputs filter criteria:
              member           │ all within 5 mi. of site
                               │ for 'event A'
                               ▼
        ┌──────────────────────────────────────────────┐
        │              Geo-Filtered List               │
        └──────────────────────────────────────────────┘
```

## Architecture: How Apps Are Built And Deployed

GASify packages standard web-app code into a GAS-compatible bundle, deployed directly into [Google's Cloud](https://cloud.google.com/) — so the new capability simply shows up as a menu item inside the customer's browser, with nothing for them to install beyond a one-click Marketplace add.  The core pieces are already built and in use — the [gas-demodulify-plugin](https://github.com/doikayt/gas-demodulify-plugin) 
(the Webpack plugin that performs the GAS-compatible bundling) and the shared [build-tools](https://github.com/doikayt/build-tools) suite it depends on. 

```
        ┌──────────────────────────────────────────────┐
        │             Traditional Web App              │
        │          (shared TypeScript stack)           │
        └──────────────────────────────────────────────┘
                              │
               Gasify Adapter │  rewrites into a
                              │  GAS-compatible bundle
                              ▼
        ┌──────────────────────────────────────────────┐
        │                 Google Cloud                 │
        │       (hosts & runs the GAS extension)       │
        └──────────────────────────────────────────────┘
                              │
                       deploy │  triggers ext. menu
                              ▼
        ┌──────────────────────────────────────────────┐
        │              Consumer's Browser              │
        │        (Google Sheet, extension menu)        │
        └──────────────────────────────────────────────┘
```

## Distribution Channel

Customers can sign up via **[Google Workspace Marketplace](https://workspace.google.com/marketplace):** the official app store for Google Workspace. Any organization already using Sheets can find and install geoCRM in a couple of clicks — no migration, no new account, no separate login.

## Commercial Opportunity

Pitch geoCRM as **a lightweight [CRM](https://en.wikipedia.org/wiki/Customer_relationship_management) layer for Google Sheets** — no migration cost, no per-seat CRM subscription, works inside the spreadsheet teams already maintain.

**Initial sector — Grassroots & community organizations:** campaigns, mutual-aid groups, congregations, PTAs — coordinators already tracking volunteers or supporters in a shared Sheet who need to segment contacts by proximity to an event and capture new sign-ups on the spot.

**Adjacent markets:**

- **Real estate** — QR sign-in at open houses plus radius-based prospecting around new listings; a workflow already proven by tools like [Curb Hero](https://curbhe.ro/) (free digital sign-in) and [Vulcan7](https://www.vulcan7.com/) (paid radius prospecting).
- **Field service & local delivery** — the geo-filter alone answers "who's a customer within my service area," the same job enterprise tools like [Salesforce Maps](https://www.salesforce.com/products/sales-mapping-software/) and [Geopointe](https://www.geopointe.com/) sell for $75/user/month — geoCRM delivers it at a fraction of that cost for small operators.

## Expansion Opportunity: Microsoft 365

- [Microsoft 365](https://www.microsoft.com/microsoft-365) has a larger overall installed base than Google Workspace.
- A port to MS365 is a moderate, well-scoped engineering effort, not a rewrite.
- Realistic as a phase-two initiative once geoCRM is validated in market.

## Legal Structure

geoCRM is developed under [Doikayt Mob Rule Laboratories (DML)](https://wiki.doikayt.org/), which is exploring [501(c)(3) nonprofit status](https://www.irs.gov/charities-non-profits/charitable-organizations/exemption-requirements-501c3-organizations). As geoCRM and future products generate revenue, that operational activity is planned to roll into a wholly owned for-profit subsidiary — preserving the nonprofit's mission and governance while giving the commercial side room to grow sustainably.



