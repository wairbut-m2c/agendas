module Admin
  class OrganizationsController < AdminController

    load_and_authorize_resource

    before_action :set_organization, only: [:update, :edit]

    def index
      @organizations = Organization.all.page(params[:page]).per(25)
    end

    def create
      @organization = Organization.new(organization_params)
      if @organization.save
        redirect_to admin_organizations_path, notice: t('backend.successfully_created_record')
      else
        flash[:alert] = t('backend.review_errors')
        render :new
      end
    end

    def new
      @organization = Organization.new
      @organization.user = User.new
    end

    def edit
    end

    def update
      if @organization.update_attributes(organization_params)
        redirect_to admin_organizations_path, notice: t('backend.successfully_updated_record')
      else
        flash[:alert] = t('backend.review_errors')
        render :edit
      end
    end

    private

      def organization_params
        params.require(:organization)
              .permit(:reference, :identifier, :name, :first_surname, :second_surname, :phones, :email,
                      :web, :address_type, :address, :number, :gateway, :stairs, :floor, :door,
                      :postal_code, :town, :province, :description, :registered_lobbies, :category_id,
                      :fiscal_year, :range_fund, :subvention, :contract, :denied_public_data, :denied_public_events, interest_ids: [],
                      legal_representant_attributes: [:identifier, :name, :first_surname, :second_surname, :phones, :email, :_destroy],
                      user_attributes: [:id, :first_name, :last_name, :role, :email, :active, :phones, :password, :password_confirmation],
                      represented_entities_attributes: [:id, :identifier, :name, :first_surname, :second_surname,
                                                        :from, :fiscal_year, :range_fund, :subvention, :contract, :_destroy],
                      organization_interests_attributes: [:interest_ids],
                      agents_attributes: [:id, :identifier, :name, :first_surname, :second_surname, :from, :to, :public_assignments, :_destroy])
      end

      def set_organization
        @organization = Organization.find(params[:id])
      end

  end
end
