// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import "chartkick/chart.js"

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

function initTooltip() {
  const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
  tooltipTriggerList.map(function (tooltipTriggerEl) {
      new bootstrap.Tooltip(tooltipTriggerEl, {
          container: 'body' // Appends tooltip to the body for better positioning
      });
  });
}

  document.addEventListener('turbo:load', () => {
    initTagifyInputs();
    initTooltip();
  });
  
  document.addEventListener('turbo:render', () => {
    initTagifyInputs();
  });

  document.addEventListener("turbo:load", function () {
    (function () {
      const e = {
        gridSelector: ".bsb-project-1-grid",
        itemSelector: ".bsb-project-1-item",
        grid: "",
        initiated() {
          const t = document.querySelector(e.gridSelector);
          if (t != null) {
            t.classList.add("bsb-project-1-initiated");
          }
        },
        init() {
          const $grid = jQuery(e.gridSelector);
          if ($grid.length > 0) {
            e.grid = $grid.imagesLoaded(function () {
              e.grid.isotope({
                itemSelector: e.itemSelector,
                layoutMode: "packery",
                transitionDuration: "0.8s",
              });
            });
            e.initiated();
          }
        },
      };
  
      e.init();
    })();
  });
  