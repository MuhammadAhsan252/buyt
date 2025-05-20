// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

function initTagifyInputs() {
    document.querySelectorAll('.solutions input[data-role="tag-input"]').forEach(function (el) {
      new Tagify(el, {
        whitelist: [
            "CRM", "ERP", "E-commerce", "CMS", "Web App", "Mobile App", "SaaS", "PWA", "AI/ML", "Blockchain", "IoT", "AR/VR"
        ],
        originalInputValueFormat: valuesArr => valuesArr.map(item => item.value),
        enforceWhitelist: true,
        dropdown: {
          maxItems: 10,
          classname: "tags-look",
          enabled: 0,
          closeOnSelect: false,
        }
      });
    });
  
    document.querySelectorAll('.pain_points input[data-role="tag-input"]').forEach(function (el) {
      new Tagify(el, {
        whitelist: [
            "Workflow Automation", "Data Management", "Customer Engagement", "Inventory Control", "Sales Tracking", "Marketing Automation", "Reporting & Analytics", "Collaboration Tools", "Task Management", "Time Tracking", "Document Management", "Project Management", "Lead Generation", "Email Marketing", "Social Media Management", "Customer Support"
        ],
        originalInputValueFormat: valuesArr => valuesArr.map(item => item.value),
        enforceWhitelist: true,
        dropdown: {
          maxItems: 10,
          classname: "tags-look",
          enabled: 0,
          closeOnSelect: false,
        }
      });
    });
  }

  document.addEventListener('turbo:load', () => {
    initTagifyInputs();
  });
  
  document.addEventListener('turbo:render', () => {
    initTagifyInputs();
  });