class CommonQuestionsController < ApplicationController

   def index

      q1 = CommonQuestion.new
      q1.question = "What is taskr?"
      q1.answer = "taskr is an awesome tool that is going to change your life.
      taskr is your one stop shop to organize all your tasks. You'll also be able to track comments that you and others make.
      taskr may eventually replace all need for paper and pens in the entire world.
      Well, maybe not, but it's going to be pretty cool."
      q1.slug = "what-is-taskr"

      q2 = CommonQuestion.new
      q2.question = "How do I join taskr?"
      q2.answer = "As soon as it's ready for the public, you'll see a signup link in the upper right.
      Once that's there, just click it and fill in the form!"
      q2.slug = "how-do-i-join-taskr"

      q3 = CommonQuestion.new
      q3.question = "When will taskr be finished?"
      q3.answer = "taskr is a work in progress.
      That being said, it should be fully functional in the next few weeks. Functional.
      Check in daily for new features and awesome functionality.
      It's going to blow your mind. Organization is just a click away. Amazing!"
      q3.slug = "when-will-taskr-be-finished"

    @common_questions = [q1, q2, q3]
   end
 end
