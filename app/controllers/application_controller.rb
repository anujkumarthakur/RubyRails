class ApplicationController < ActionController::Base
    # before_action :authorize
    before_action :set_i18n_locale_from_params

    protected
        def authorize
            unless User.find_by(id: session[:user_id]) || signup_action?
                redirect_to login_url, notice: "Please log in"
            end
        end

        def set_i18n_locale_from_params
            if params[:locale]
                if I18n.available_locales.map(&:to_s).include?(params[:locale])
                    I18n.locale = params[:locale]
                else
                    flash.now[:notice] = 
                        "#{params[:locale]} translation not avaliable"
                    logger.error flash.now[:notice]
                end
            end
        end

        def signup_action?
            controller_name == 'users' && (action_name == 'new' || action_name == 'create')
        end
end
