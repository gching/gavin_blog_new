class PermittedParams < Struct.new(:params)#, :user)
  def chapter
    params.require(:chapter).permit(*chapter_attributes)
  end

  def chapter_attributes
    #if user && user.admin?
     # [:name, :sticky]
    #else
      # [:name]
    #end
    [:title, :body]
  end
end