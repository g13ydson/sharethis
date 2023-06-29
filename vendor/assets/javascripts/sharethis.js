window.Sharethis = {
  openUrl: function(url, width, height) {
    width = width || 640;
    height = height || 480;
    var left = (screen.width / 2) - (width / 2);
    var top = (screen.height * 0.3) - (height / 2);
    var opt = 'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top + ',menubar=no,status=no,location=no';
    window.open(url, 'popup', opt);
    return false;
  },

  share: function(el) {
    if (!el.getAttribute) {
      el = document.querySelector(el);
    }

    var site = el.getAttribute("data-site");
    var appkey = el.getAttribute("data-appkey") || '';
    var $parent = el.parentNode;
    var title = encodeURIComponent(el.getAttribute('data-' + site + '-title') || $parent.getAttribute('data-title') || '');
    var img = encodeURIComponent($parent.getAttribute("data-img") || '');
    var url = encodeURIComponent($parent.getAttribute("data-url") || location.href);
    var via = encodeURIComponent($parent.getAttribute("data-via") || '');
    var desc = encodeURIComponent($parent.getAttribute("data-desc") || ' ');

    // tracking click events if Google Analytics is enabled
    var ga = window[window['GoogleAnalyticsObject'] || 'ga'];
    if (typeof ga === 'function') {
      ga('send', 'event', 'Social Share Button', 'click', site);
    }

    switch (site) {
      case "email":
        location.href = 'mailto:?subject=' + title + '&body=' + url;
        break;
      case "twitter":
        var hashtags = encodeURIComponent(el.getAttribute('data-' + site + '-hashtags') || $parent.getAttribute('data-hashtags') || '');
        var via_str = via.length > 0 ? '&via=' + via : '';
        this.openUrl('https://twitter.com/intent/tweet?url=' + url + '&text=' + title + '&hashtags=' + hashtags + via_str, 650, 300);
        break;
      case "facebook":
        this.openUrl('http://www.facebook.com/sharer/sharer.php?u=' + url, 555, 400);
        break;
      case "google_bookmark":
        this.openUrl('https://www.google.com/bookmarks/mark?op=edit&output=popup&bkmk=' + url + '&title=' + title);
        break;
      case "pinterest":
        this.openUrl('http://www.pinterest.com/pin/create/button/?url=' + url + '&media=' + img + '&description=' + title);
        break;
      case "linkedin":
        this.openUrl('https://www.linkedin.com/shareArticle?mini=true&url=' + url + '&title=' + title + '&summary=' + desc);
        break;
      case "vkontakte":
        this.openUrl('http://vk.com/share.php?url=' + url + '&title=' + title + '&image=' + img);
        break;
      case "reddit":
        this.openUrl('http://www.reddit.com/submit?url=' + url + '&newwindow=1', 555, 400);
        break;
      case "telegram":
        this.openUrl('https://telegram.me/share/url?text=' + title + '&url=' + url);
        break;
      case "whatsapp_app":
        var whatsappAppUrl = 'whatsapp://send?text=' + title + '%0A' + url;
        window.open(whatsappAppUrl, '_top');
        break;
      case "whatsapp_web":
        this.openUrl('https://web.whatsapp.com/send?text=' + title + '%0A' + url);
        break;
    }

    return false;
  }
};
