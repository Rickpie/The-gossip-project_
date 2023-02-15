class GossipController < ApplicationController
    def index
        @gossip = Gossip.all
    end
    
    def show
        @gossip = Gossip.find(params[:id])
    end

    def new
        @gossip = Gossip.new
    end
    
    def create
        @gossip = Gossip.new(title: params[:title],
                             content: params[:content],
                             user: User.find(params[:user]))
        if @gossip.save
          redirect_to root_path
        else
          render 'new'
        end
    end

    def edit
        @gossip = Gossip.find(params[:id])
    end
    
    def update
        @gossip = Gossip.find(params[:id])
        post_params = params.require(:gossip).permit(:title, :content)
        @gossip.update(post_params)
        redirect_to gossip_path
    end

    def destroy
        @gossip = Gossip.find(params[:id])
        @gossip.destroy
        redirect_to root_path
    end

end
