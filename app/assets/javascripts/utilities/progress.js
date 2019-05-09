document.addEventListener('turbolinks:load', function () {
  var progress_bar = document.querySelector('.progress-bar');

  if (progress_bar) {
  	var question = progress_bar.dataset.currentQuestion;
    var all_questions = progress_bar.dataset.allQuestions;

    var result = Math.round(question / all_questions * 100) + '%';

    progress_bar.style.width = result;
    progress_bar.textContent = result;
  }
});
