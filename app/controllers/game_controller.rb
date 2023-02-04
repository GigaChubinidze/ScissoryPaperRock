class GameController < ApplicationController

  def new; end

  def throw
    outcome_calculation

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    def variable_definement
      @throws = %w{rock paper scissors red_button}
      @user_throw = params[:sign]
      url = "https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      body = JSON.parse(response)
      @server_throw = body['body'].gsub(/\"/,'') if body['body']
      @server_throw = @throws[rand(3)] if body['errorMessage'] || body['statusCode'] != 200
    end

    def outcome_calculation
      variable_definement

      if @user_throw == @server_throw
        @status = t 'controller.status.tie'
      elsif !(@throws.include? @server_throw)
        @server_throw = t 'controller.server_throw.undefined'
        @status = t 'controller.status.win'
        @message = t 'controller.message.prohibited'
      elsif (@user_throw == @throws[0] &&  @server_throw == @throws[2]) || (@user_throw == @throws[1] &&  @server_throw == @throws[0]) || (@user_throw == @throws[2] &&  @server_throw == @throws[1])
        @status = t 'controller.status.win'
        @message = t 'controller.message.lose', action: @server_throw
      elsif (@user_throw == @throws[3])
        @status = t 'controller.status.stalemate'
        @message = t 'controller.message.stalemate'
      else
        @status = t 'controller.status.lose'
        @message = t 'controller.message.win', action: @server_throw
      end
    end
end
