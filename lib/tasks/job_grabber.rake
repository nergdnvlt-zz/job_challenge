namespace :job do

  desc 'Replinishes jobs in the database'
  task update: :environment do
    delete_old_jobs
    grab_jobs
  end

  def delete_old_jobs
    Job.delete_all
  end

  def grab_jobs
    JobService.get_jobs
  end
end
