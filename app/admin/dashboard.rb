# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
    content do
      render ‘’
    end

    columns do
      column do
        panel "Travels" do
          table do
            thead do
              tr do
                th "Name"
                th "Email"
                th "Age"
                th "Gender"
                th "Contat"
                th "Status"
                tbody do
                  User.with_role(:travels).each do|travels|
                    tr 
                    td travels.full_name
                    td travels.email
                    td travels.age
                    td travels.gender
                    td travels.contact
                    td travels.status
                    td  do
                      if travels.status=="approved" 
                         link_to "Reject", change_status_user_path(travels.id, status: "rejected"), method: :patch, class: "btn btn-primary" 
                      elsif travels.status=="rejected" 
                         link_to "Approve", change_status_user_path(travels.id, status: "approved"), method: :patch
                      else 
                         link_to "Approve", change_status_user_path(travels.id, status: "approved"), method: :patch 
                         link_to "Reject", change_status_user_path(travels.id, status: "rejected"), method: :patch 
                      end
                    end
                  end
                end
              end
            end  
          end
        end
      end 
    end
  end # content
end
  
  