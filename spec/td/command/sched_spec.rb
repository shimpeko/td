require 'spec_helper'
require 'td/command/common'
require 'td/config'
require 'td/command/list'
require 'td/command/sched'
require 'td/client/model'
require 'time'

module TreasureData::Command
  describe TreasureData::Command do
    let(:client) { Object.new }

    let :job_params do
      ['job_id', :type, 'query', 'status', nil, nil, time, time, 123, 456]
    end

    let(:job1) { TreasureData::ScheduledJob.new(client, '2015-02-17 13:22:52 +0900', *job_params) }
    let(:job2) { TreasureData::ScheduledJob.new(client, nil, *job_params) }
    let(:time) { Time.now.xmlschema }
    let(:command) { Class.new { include TreasureData::Command }.new }
    let(:argv) { [] }
    let(:schedules) { [] }
    let(:op) { List::CommandParser.new('sched:last_job', %w[], %w[], false, argv, []) }

    before do
      client.stub(:schedules).and_return(schedules)
      command.stub(:get_client).and_return(client)
    end

    describe 'sched_history' do
      before do
        client.stub(:history).and_return(history)
      end

      let(:history) { [job1, job2] }

      it 'runs' do
        expect {
          command.sched_history(op)
        }.to_not raise_exception
      end
    end

    describe 'sched_result' do
      subject { command.sched_result(op) }

      before do
        command.stub(:get_history).with(client, nil, (back_number - 1), back_number).and_return(history)
      end

      shared_examples_for("passing argv and job_id to job:show") do
        it "invoke 'job:show [original argv] [job id]'" do
          TreasureData::Command::Runner.any_instance.should_receive(:run).with(["job:show", *show_arg, job_id])
          subject
        end
      end

      context "history exists" do

        let(:job_id) { history.first.job_id }

        context 'without --last option' do
          let(:history) { [job1] }
          let(:back_number) { 1 }

          let(:argv) { %w(--last --format csv) }
          let(:show_arg) { %w(--format csv) }
          it_behaves_like "passing argv and job_id to job:show"
        end

        context '--last witout Num' do
          let(:history) { [job1] }
          let(:back_number) { 1 }

          let(:argv) { %w(--last --format csv) }
          let(:show_arg) { %w(--format csv) }
          it_behaves_like "passing argv and job_id to job:show"
        end

        context '--last 1' do
          let(:history) { [job1] }
          let(:back_number) { 1 }

          let(:argv) { %w(--last 1 --format csv) }
          let(:show_arg) { %w(--format csv) }
          it_behaves_like "passing argv and job_id to job:show"
        end

        context '--last 1 and --limit 1' do
          let(:history) { [job1] }
          let(:back_number) { 1 }

          let(:argv) { %w(--last 1 --format csv --limit 1) }
          let(:show_arg) { %w(--format csv --limit 1) }
          it_behaves_like "passing argv and job_id to job:show"
        end

        context '--last 2 after format option' do
          let(:history) { [job2] }
          let(:back_number) { 2 }

          let(:argv) { %w(--format csv --last 2 ) }
          let(:show_arg) { %w(--format csv) }
          it_behaves_like "passing argv and job_id to job:show"
        end

        context '--last 3(too back over)' do
          let(:history) { [] }
          let(:back_number) { 3 }

          let(:argv) { %w(--last 3 --format csv) }
          it 'raise ' do
            expect {
              command.sched_result(op)
            }.to raise_exception, "No jobs available for this query. Refer to 'sched:history'"
          end
        end

        context '--last WRONGARG(not a number)' do
          let(:history) { [job1] }
          let(:back_number) { 1 }

          let(:argv) { %w(--last TEST --format csv) }

          it "exit with 1" do
            begin
              command.sched_result(op)
            rescue SystemExit => e
              expect(e.status).to eq 1
            end
          end
        end
      end

      context "history dose not exists" do
        let(:back_number) { 1 }
        let(:history) { [] }
        before { client.stub(:history) { raise TreasureData::NotFoundError } }

        it "exit with 1" do
          begin
            subject
          rescue SystemExit => e
            expect(e.status).to eq 1
          end
        end
      end
    end
  end
end
