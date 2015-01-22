class CommonQuestionsController < ApplicationController

   def index

      q1 = CommonQuestion.new
      q1.question = "What is gCamp?"
      q1.answer = "gCamp is an awesome tool that is going to change your life.
      gCamp is your one stop shop to organize all your tasks. You'll also be able to track comments that you and others make.
      gCamp may eventually replace all need for paper and pens in the entire world.
      Well, maybe not, but it's going to be pretty cool."
      q1.slug = "what-is-gcamp"

      q2 = CommonQuestion.new
      q2.question = "How do I join gCamp?"
      q2.answer = "As soon as it's ready for the public, you'll see a signup link in the upper right.
      Once that's there, just click it and fill in the form!"
      q2.slug = "how-do-i-join-gcamp"

      q3 = CommonQuestion.new
      q3.question = "When will gCamp be finished?"
      q3.answer = "gCamp is a work in progress.
      That being said, it should be fully functional in the next few weeks. Functional.
      Check in daily for new features and awesome functionality.
      It's going to blow your mind. Organization is just a click away. Amazing!"
      q3.slug = "when-will-gcamp-be-finished"

    @common_questions = [q1, q2, q3]
   end
 end




 # Create a CommonQuestion class that has
 # a question attribute
 # an answer attribute
 # a slug attribute
 # (if the question is "How much does it cost" the slug would be "how-much-does-it-cost")
 # Create a CommonQuestions controller and a route to its index action with the path '/faq'. In the controller, create an array of CommonQuestion objects and assign it to an instance variable.
 # In the view, iterate over the array of FAQ objects to generate the page.