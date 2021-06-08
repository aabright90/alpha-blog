class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit    
        @article = Article.find(params[:id])
    end

    def create
        # "require" and "permit" are needed to prevent a ForbiddenAttributesError 
        # this is a security feature in rails
        # "render" renders information to the screen
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
            #notice and alert
            flash[:notice] = "Article was created successfully"
            redirect_to @article
        else
          render 'new'  
        end
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Article was updated successfully."
            redirect_to @article
        else
            render 'edit'
        end
    end

end