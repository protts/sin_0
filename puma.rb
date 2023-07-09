require './config/env'

threads_count = Integer(ENV['THREAD_COUNT'] || 5)
threads threads_count, threads_count

port        ENV['PORT']     || 3000
environment ENV['development'] || 'development'
