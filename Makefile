.PHONY: test
test:
	@echo "Running tests..."
	@hurl --test tests/*.hurl

.PHONY: report
report:
	@echo "Generating report..."
	@hurl --test tests/*.hurl --report-html test-report

.PHONY: view-report
view-report:
	@echo "Viewing report..."
	@bunx serve test-report
