module Sharethis
  module Helper
    def sharethis(title = "", opts = {})
      opts[:allow_sites] ||= %w[twitter facebook google_bookmark pinterest email linkedin vkontakte reddit telegram
        whatsapp_app whatsapp_web]

      html = []
      html << "<div class='sharethis' data-title='#{h(title)}' data-img='#{opts[:image]}'"
      html << "data-url='#{opts[:url]}' data-desc='#{opts[:desc]}' data-via='#{opts[:via]}'>"

      opts[:allow_sites].each do |name|
        special_data = opts.select { |k, _| k.to_s.start_with?("data-" + name) }

        link_title = t("sharethis.share_to", name: t("sharethis.#{name.downcase}"))
        html << link_to("", "#", {
          rel: ["nofollow", opts[:rel]],
          "data-site": name,
          class: "share-icon share-#{name}",
          onclick: "return Sharethis.share(this);",
          title: h(link_title)
        }.merge(special_data))
      end

      html << "</div>"
      raw html.join("\n")
    end
  end
end
