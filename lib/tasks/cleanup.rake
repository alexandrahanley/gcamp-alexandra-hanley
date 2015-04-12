namespace :clean do

   task delete_memberships: :environment do
     Membership.all.each do |member|
       if member.user.nil? || member.project.nil?
         member.destroy
       end
     end
   end


   task delete_tasks_projects: :environment do
     Task.all.each do |task|
       if task.project.nil?
         task.destroy
       end
     end
   end

   task delete_comments_tasks: :environment do
     Comment.all.each do |comment|
       if comment.task.nil?
         comment.destroy
       end
     end
   end

   task set_comments_user: :environment do
     Comment.all.each do |comment|
       if comment.user.nil?
         comment.user_id = nil
         comment.save
       end
     end
   end

   task delete_tasks_project_id: :environment do
     Task.all.each do |task|
       if task.project_id.nil?
         task.destroy
       end
     end
   end

   task delete_comments_task_id: :environment do
     Comment.all.each do |comment|
       if comment.task_id.nil?
         comment.destroy
       end
     end
   end

end
