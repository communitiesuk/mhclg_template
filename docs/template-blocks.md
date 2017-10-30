## GOV.UK template blocks and their default values

| Template block name       |  Location / Information                         |   Default template values
|---                        |---                                              |---
| top_of_page               | Before doctype                                  | Insertion point
| html_lang                 | value of the HTML lang attribute                | en
| page_title                | Text inside the `<title>` element               | Hackney Council template
| head                      | Before closing `</head>` element                | Insertion point
| body_classes              | Classes to be added to the `<body>` element     | Insertion point
| body_start                | After opening `<body>` element                  | Insertion point
| skip_link_message         | Text inside the skip to main content link       | Skip to main content
| cookie_message            | Text inside the cookie message banner           | `<p>Hackney.gov.uk uses cookies to make the site simpler. <a href="https://www.hackney.gov.uk/data-protection-foi">Find out more about cookies</a></p>`
| header_class              | `<header>` element                              | Set the value of header_class to [with-proposition](usage.md#propositional-title-and-navigation) to show the propositional navigation
| homepage_url              | URL of anchor element wrapping logo             | https://www.hackney.gov.uk/
| logo_link_title           | Title of anchor element wrapping logo           | Go to the Hackney Council homepage
| global_header_text        | Text next to the crown image                    | Hackney Council
| inside_header             | Inside parent `.header-global`                  | Insertion point
| proposition_header        | Inside parent `.header-wrapper`                 | Add a [propositional title and navigation links](usage.md#propositional-title-and-navigation)
| after_header              | After closing `</header>` element               | Insertion point
| content                   | Main content goes in here                       | Insertion point. Content must be wrapped with `id="content"` for the [skiplink to work](usage.md#skip-link).
| footer_top                | Inside parent `#footer-wrapper`                 | Insertion point
| footer_support_links      | Inside parent `.footer-meta-inner`              | Insertion point
| hackney_copyright_message | Copyright message                               | © London Borough of Hackney
| body_end                  | Before closing `</body>` element                | Insertion point
