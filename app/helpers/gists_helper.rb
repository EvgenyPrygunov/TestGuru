module GistsHelper
  def gist_hash(url)
    # /(?<=com\/).*/.match(url)
    /.*/.match(url)
  end
end
