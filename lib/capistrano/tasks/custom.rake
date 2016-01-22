namespace :custom do
  desc 'Show deployed revision'
  task :revision do
    on roles(:app) do
      run_locally do
        execute 'git log -1 --name-status'
      end
      execute 'cat #{current_path}/REVISION'
      execute 'tail #{deploy_path}/revisions.log'
    end
  end
end