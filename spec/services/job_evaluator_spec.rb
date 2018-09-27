require 'rails_helper'

describe 'JobEvaluator' do
  describe 'it creates a job from job JSON' do
    it 'returns a database job object' do
      boston = City.create!(name: 'Boston')
      java = boston.languages.create!(name: 'Java')

      job_attrs = {:id=>"e348953a-abb9-11e8-8c9c-0e0fd8d099cd",
        :created_at=>"Wed Aug 29 18:35:29 UTC 2018",
        :title=>"Full Stack Developer",
        :location=>"Burlington, MA",
        :type=>"Full Time",
        :description=>
         "<p>The way the world builds software is changing. Today’s successful digital enterprises employ new tools and workflows to allow them to deliver better software faster, even if they’re not in the business of software. In this position, you’ll have the opportunity to turn your creativity into market-leading solutions that give XebiaLabs customers the ability to do what they do: launch satellites, fly airplanes, power millions of homes, manage billions in assets, and much more. </p>\n\n<p>Responsibilities </p>\n\n<ul>\n<li>Architect, design, implement, and test product features </li>\n<li> Work with a team of developers who are just as passionate about technology as you are </li>\n<li> Work with the latest technologies – Scala or Java, AngularJS or react Git, Docker, Kubernetes, and more </li>\n<li> Improve your skills as part of our bi-weekly knowledge exchange events, monthly tech rallies, and training opportunities </li>\n</ul><p>Requirements</p>\n\n<ul>\n<li> Minimum 4 years professional Java software development </li>\n<li> Proven experience using Python for software development<br>\n</li>\n<li> Proven ability to design and develop complex applications </li>\n<li> Experience with either Scala or AngularJS, either on the job or on hobby projects </li>\n<li> Self-motivated team player who thrives in a high-energy, dynamic environment </li>\n<li> Results-driven: delivering the best possible product at the right time is what counts </li>\n<li> Higher vocational or university education, preferably in IT/technical </li>\n<li> Ability to think analytically and creatively </li>\n<li> Good written and spoken English </li>\n</ul><p>About XebiaLabs\nDelivering software applications to production faster and more reliably has become imperative to the future success of any business. XebiaLabs was founded in the early days of DevOps to help large companies accelerate their software releases more reliably no matter how diverse the infrastructure or how complex the processes.</p>\n\n<p>Top ranked by leading industry analysts, our enterprise DevOps platform has been adopted by the largest and most demanding companies in the world, providing them with the intelligence, automation, and control they need to deliver software faster and with less risk. Our team includes some of the early DevOps visionaries and thought leaders who literally wrote the book on Continuous Delivery. Our industry veterans are passionate developers and enterprise IT pros who know how to connect the dots for enterprise-scale DevOps.</p>\n\n<p>Headquartered in the US, founded in the Netherlands, with additional offices in the UK, France, Germany, India, and Spain, XebiaLabs has been on an exponential growth trajectory, propelled by the excellence of its employees. Join a team of fun and driven professionals as we help shape the DevOps market and develop the next generation of DevOps software!</p>",
        :how_to_apply=>"<p>Applications and information:\nPlease send your resume to <a href=\"mailto:careers@xebialabs.com\">careers@xebialabs.com</a></p>",
        :company=>"XebiaLabs",
        :company_url=>"http://www.xebialabs.com",
        :company_logo=>"http://github-jobs.s3.amazonaws.com/1acf69a4-abb8-11e8-8526-c0949847c598.png",
        :url=>"http://jobs.github.com/positions/e348953a-abb9-11e8-8c9c-0e0fd8d099cd"}

      job = JobEvaluator.create_job(java, job_attrs)

      expect(job.title).to eq('Full Stack Developer')
      expect(job.job_type).to eq('Full Time')
    end
  end
end
