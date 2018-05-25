module TestPassagesHelper
  def test_passage_result(test_passage)
    if test_passage.passed?
      content_tag(:span, "#{test_passage.correct_answers_percent}", style: "color: green") <<
          'Test passed!'
    else
      content_tag(:span, "#{test_passage.correct_answers_percent}", style: "color: red") <<
          'Test failed!'
    end
  end
end
