module TestPassagesHelper
  def test_passage_result(result)
    if @test_passage.passed?
      content_tag(:span, "#{result}", style: "color: green") <<
          'Test passed!'
    else
      content_tag(:span, "#{result}", style: "color: red") <<
          'Test failed!'
    end
  end
end
