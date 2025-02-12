{% if not settings.home_popup_title %}
    {% set modal_padding_top = 'modal-home-promotional-top' %}
{% endif %}

{% embed "snipplets/modal.tpl" with{modal_id: 'home-modal', modal_class: 'home-promotional modal-bottom-sheet modal-shadow ' ~ modal_padding_top, modal_position: 'bottom', modal_transition: 'slide', modal_header_title: fals, modal_footer: false, modal_width: 'docked-md modal-docked-small modal-docked-md-right', modal_header_class: 'modal-floating-close modal-header-no-title'  } %}
    {% block modal_body %}
        {% if settings.home_popup_title %}
            <h3 class="h5 mb-3 pr-4">{{ settings.home_popup_title }}</h3>
        {% endif %}

        {% if "home_popup_image.jpg" | has_custom_image %}
            <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset='{{ "home_popup_image.jpg" | static_url | settings_image_url('large') }} 480w, {{ "home_popup_image.jpg" | static_url | settings_image_url('huge') }} 640w' class="lazyload fade-in modal-img-full mb-3"/>
        {% endif %}

        {% if settings.home_popup_txt %}
            <p class="mb-3">{{ settings.home_popup_txt }}</p>
        {% endif %}

        {% if settings.home_news_box %}
            <div id="news-popup-form-container" class="newsletter">
                <form id="news-popup-form" method="post" action="/winnie-pooh" class="js-news-form" data-store="newsletter-form-popup">
                    <div class="input-append">
                        <div class="row">
                            <div class="col pr-2">
                                {% embed "snipplets/forms/form-input.tpl" with{input_for: 'email', type_email: true, input_name: 'email', input_id: 'email', input_placeholder: 'Email', input_custom_class: "js-mandatory-field form-control-rounded", input_aria_label: 'Email' | translate } %}
                                {% endembed %}
                            </div>
                            <div class="col-auto pl-0">
                                <div class="winnie-pooh" style="display: none;">
                                    <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
                                    <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
                                </div>
                                <input type="hidden" name="name" value="{{ "Sin nombre" | translate }}" />
                                <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
                                <input type="hidden" name="type" value="newsletter" />
                                <div class="">
                                    <button class="js-news-popup-submit btn btn-medium btn-primary" type="submit" value="{{ 'Enviar' | translate }}" name="contact">
                                        {{ "Enviar" | translate }}
                                        <span class="js-news-spinner" style="display: none;">
                                            {% include "snipplets/svg/spinner-third.tpl" with {svg_custom_class: "icon-inline icon-xs icon-spin ml-1"} %}
                                        </span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="js-news-spinner h6" style='display: none;'></div>
                    <div class="js-news-popup-success alert alert-success mb-2" style='display: none;'>{{ "¡Gracias por suscribirte! A partir de ahora vas a recibir nuestras novedades en tu email" | translate }}</div>
                    <div class="js-news-popup-failed alert alert-danger mb-2" style='display: none;'>{{ "Necesitamos tu email para enviarte nuestras novedades." | translate }}</div>
                </form>
            </div>
        {% elseif settings.home_popup_btn and settings.home_popup_url %}
            <a href="{{ settings.home_popup_url }}" class="btn btn-primary d-inline-block btn-medium mb-3">{{ settings.home_popup_btn }}</a>
        {% endif %}

    {% endblock %}
{% endembed %}