require "net/http"
class HomeController < ApplicationController
  def index
  end

  def join_waitlist
  end

  def join_waitlist_submit
    form_url = URI.parse("https://docs.google.com/forms/d/e/1FAIpQLSfPo5svKyrhxr82otfdTUQlNS7Gb6o1vF0sQSTIpoEcA2Hm9g/formResponse")
    form_data = {
      "entry.26525576" => params[:full_name],
      "entry.643544342" => params[:work_email],
      "entry.1451180395" => params[:job_title],
      "entry.1204691129" => params[:company_name],
      "entry.1601835571" => params[:join_as]
    }
    res = Net::HTTP.post_form form_url, form_data
    if res.is_a?(Net::HTTPSuccess)
      redirect_to root_path, notice: "Thank you for joining the waitlist! We'll keep you updated."
    else
      redirect_to join_waitlist_path, alert: "There was an error submitting your information. Please try again."
    end
  end

  def customer_query
    form_url = URI.parse("https://docs.google.com/forms/d/e/1FAIpQLSe9Q5c7ITTRHmxQiDlCVLterjOCjmKQkX2nE-z-M8bRiJ1HWw/formResponse")
    form_data = {
      "entry.1258545897" => params[:full_name],
      "entry.1487679020" => params[:email],
      "entry.619515593" => params[:message]
    }
    res = Net::HTTP.post_form form_url, form_data
    if res.is_a?(Net::HTTPSuccess)
      redirect_to root_path, notice: "Thank you for contacting us! We'll get back to you shortly."
    else
      redirect_to root_path, alert: "There was an error submitting your message. Please try again."
    end
  end
end
