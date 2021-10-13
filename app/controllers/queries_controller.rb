class QueriesController < ApplicationController
  def new
    @query = Query.new
  end

  def create
    query = Query.new(permit_params)
    if query.save && FreshDesk::Tickets.push(permit_params)
      flash[:notice] = "We've been notified. Our team will contact you soon."
    else
      flash[:alert] = "Failed to upload your query, please try after some time."
    end

    redirect_to new_queries_path
  end

  private

  def permit_params
    params.require(:query).permit(:name, :email, :phone, :subject, :description)
  end
end
