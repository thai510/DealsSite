module SignUpHelper


def industry (somevar)
    @industry;

    render 'industry'
    while params[:industry] != nil
      @industry << params[:industry]
      render 'industry'
    end
    somevar << @industry
    return @industry
  end

end
