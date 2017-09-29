require 'erb'
require_relative 'template_processor'

module Compiler
  class EJSProcessor < TemplateProcessor

    def self.partial_for(key)
      "<%- partial('partials/_#{key}') %>"
    end

    @@yield_hash = {
      after_header:         partial_for(:after_header),
      body_classes:         "<%= bodyClasses %>",
      body_start:           partial_for(:body_start),
      body_end:             partial_for(:body_end),
      content:              partial_for(:content),
      cookie_message:       partial_for(:cookie_message),
      footer_support_links: partial_for(:footer_support_links),
      footer_top:           partial_for(:footer_top),
      homepage_url:         "<% if (homepageUrl) { %><%= homepageUrl %><% } else { %>https://www.hackney.gov.uk/<% } %>",
      global_header_text:   "<% if (globalHeaderText) { %><%= globalHeaderText %><% } %>",
      head:                 partial_for(:head),
      header_class:         "<% if (headerClass) { %><%= headerClass %><% } %>",
      html_lang:            "<% if (htmlLang) { %><%= htmlLang %><% } else { %>en<% } %>",
      inside_header:        partial_for(:inside_header),
      page_title:           partial_for(:page_title),
      proposition_header:   partial_for(:proposition_header),
      top_of_page:          partial_for(:top_of_page),
      skip_link_message:    "<% if (skipLinkMessage) { %><%= skipLinkMessage %><% } else { %>Skip to main content<% } %>",
      logo_link_title:      "<% if (logoLinkTitle) { %><%= logoLinkTitle %><% } else { %>Go to the Hackney Council homepage<% } %>",
      licence_message:      partial_for(:licence_message),
      hackney_copyright_message: "<% if (hackneyCopyrightMessage) { %><%= hackneyCopyrightMessage %><% } else { %>&copy; London Borough of Hackney<% } %>",
    }


    def handle_yield(section = :layout)
      @@yield_hash[section]
    end

    def asset_path(file, options={})
      query_string = HackneyTemplate::VERSION
      return "#{file}?#{query_string}" if @is_stylesheet
      case File.extname(file)
      when '.css'
        "<%= HackneyTemplateAssetPath %>stylesheets/#{file}?#{query_string}"
      when '.js'
        "<%= HackneyTemplateAssetPath %>javascripts/#{file}?#{query_string}"
      else
        "<%= HackneyTemplateAssetPath %>images/#{file}?#{query_string}"
      end
    end
  end
end
