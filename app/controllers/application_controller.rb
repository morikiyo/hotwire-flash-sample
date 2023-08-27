class ApplicationController < ActionController::Base
  helper_method :modal_frame_id

  private

    def modal_frame_id
      'application_modal'
    end
end
